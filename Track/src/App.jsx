import React, { useState, useEffect } from 'react';

function App() {
    const [data, setData] = useState({ pipelines: {} });
    const [loading, setLoading] = useState(true);
    const [activeTab, setActiveTab] = useState(null);

    const fetchStats = async () => {
        try {
            const response = await fetch('/api/stats');
            const result = await response.json();
            setData(result);

            // Set first pipeline as active if none selected
            const pipelines = Object.keys(result.pipelines);
            if (!activeTab && pipelines.length > 0) {
                setActiveTab(pipelines[0]);
            }

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

    const pipelines = Object.keys(data.pipelines);
    if (pipelines.length === 0) {
        return (
            <div className="dashboard" style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', height: '80vh' }}>
                <h2 style={{ color: 'rgba(255,255,255,0.4)' }}>Không tìm thấy dữ liệu benchmark.</h2>
                <p style={{ color: 'rgba(255,255,255,0.2)' }}>Đang đợi file benchmark_results_*.json...</p>
            </div>
        );
    }

    const activeData = data.pipelines[activeTab] || { results: [] };

    return (
        <div className="dashboard">
            <header>
                <h1>Text2SQL Benchmark Dashboard</h1>
                <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                    <div className="pulse" style={{ width: '10px', height: '10px', borderRadius: '50%', backgroundColor: '#00f2fe' }}></div>
                    <span style={{ fontSize: '0.9rem', color: 'rgba(255,255,255,0.6)' }}>Cập nhật mỗi 5 giây</span>
                </div>
            </header>

            <div className="stats-grid" style={{ gridTemplateColumns: `repeat(${Math.min(pipelines.length, 4)}, 1fr)` }}>
                {pipelines.map(name => (
                    <div
                        key={name}
                        className={`card ${activeTab === name ? 'active-card' : ''}`}
                        onClick={() => setActiveTab(name)}
                        style={{ cursor: 'pointer', transition: 'all 0.3s ease', border: activeTab === name ? '1px solid #00f2fe' : '1px solid transparent' }}
                    >
                        <div className="stat-label" style={{ fontSize: '0.8rem', textTransform: 'uppercase', opacity: 0.7 }}>Pipeline: {name}</div>
                        <div className="stat-value" style={{ fontSize: '1.8rem', margin: '10px 0' }}>{data.pipelines[name].percentage}%</div>
                        <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '0.9rem', opacity: 0.6 }}>
                            <span>EM: {data.pipelines[name].correct}</span>
                            <span>Total: {data.pipelines[name].total}</span>
                        </div>
                    </div>
                ))}
            </div>

            <div className="table-container">
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '15px' }}>
                    <h2 style={{ fontSize: '1.2rem', margin: 0 }}>Chi tiết: <strong>{activeTab}</strong></h2>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th style={{ width: '60px' }}>ID</th>
                            <th>Câu hỏi</th>
                            <th style={{ width: '100px' }}>Trạng thái</th>
                            <th style={{ width: '120px' }}>EM/Error</th>
                        </tr>
                    </thead>
                    <tbody>
                        {activeData.results.map((res) => (
                            <tr key={res.id}>
                                <td style={{ fontWeight: 'bold', color: 'rgba(255,255,255,0.4)' }}>#{res.id}</td>
                                <td className="truncate" title={res.question}>{res.question}</td>
                                <td>
                                    <span className={`badge ${res.exact_match ? 'badge-success' : 'badge-error'}`}>
                                        {res.exact_match ? 'Match' : 'No Match'}
                                    </span>
                                </td>
                                <td style={{ fontSize: '0.85rem' }}>
                                    {res.error ? <span style={{ color: '#ff4d4d' }}>Error</span> : <span style={{ color: '#4facfe' }}>Success</span>}
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}

export default App;
