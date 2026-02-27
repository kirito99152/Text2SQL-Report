const prompts_base = require('./prompts_base');
const prompts_ablation1 = require('./prompts_ablation1');
const prompts_ablation2 = require('./prompts_ablation2');

function getPrompts(pipeline) {
    switch (pipeline) {
        case 'ablation1': return prompts_ablation1;
        case 'ablation2': return prompts_ablation2;
        default: return prompts_base;
    }
}

module.exports = {
    getPrompts
};
