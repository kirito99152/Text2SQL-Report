import React, { useState, useEffect } from 'react';

function App() {
    const [stats, setStats] = useState(null);
    const [loading, setLoading] = useState(true);

    const fetchStats = async () => {
        try {
            const response = await fetch('/api/stats');
            const data = await response.json();
            setStats(data);
            setLoading(false);
        } catch (error) {
            console.error('Error fetching stats:', error);
        }
    };

    useEffect(() => {
        fetchStats();
        const interval = setInterval(fetchStats, 5000);
        return () => clearInterval(interval);
    }, []);

    if (loading) {
        return <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh', fontSize: '1.5rem', color: '#00f2fe' }}>Đang tải dữ liệu...</div>;
    }

    return (
        <div className="dashboard">
            <header>
                <h1>Text2SQL Benchmark</h1>
                <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                    <div className="pulse" style={{ width: '10px', height: '10px', borderRadius: '50%', backgroundColor: '#00f2fe' }}></div>
                    <span style={{ fontSize: '0.9rem', color: 'rgba(255,255,255,0.6)' }}>Cập nhật mỗi 5 giây</span>
                </div>
            </header>

            <div className="stats-grid">
                <div className="card">
                    <div className="stat-label">Tổng số câu đã chạy</div>
                    <div className="stat-value">{stats.total}</div>
                </div>
                <div className="card">
                    <div className="stat-label">Số câu đúng</div>
                    <div className="stat-value" style={{ color: '#4facfe' }}>{stats.correct}</div>
                </div>
                <div className="card percentage-card">
                    <div className="stat-label">Tỷ lệ chính xác (%)</div>
                    <div className="stat-value">{stats.percentage}%</div>
                </div>
            </div>

            <div className="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Câu hỏi</th>
                            <th>Trạng thái</th>
                            <th>Thời gian (ms)</th>
                        </tr>
                    </thead>
                    <tbody>
                        {stats.results.map((res) => (
                            <tr key={res.id}>
                                <td style={{ fontWeight: 'bold', color: 'rgba(255,255,255,0.4)' }}>#{res.id}</td>
                                <td className="truncate" title={res.question}>{res.question}</td>
                                <td>
                                    <span className={`badge ${res.exact_match ? 'badge-success' : 'badge-error'}`}>
                                        {res.exact_match ? 'Đúng' : 'Sai'}
                                    </span>
                                </td>
                                <td style={{ fontFamily: 'monospace' }}>{res.duration_ms}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}

export default App;
