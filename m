Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404DA2E413
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875916; cv=none; b=cssn4AAWK6GiP0tfdVrLQLqk9ehKgpjacflHD9NdFZvtiSdBdBcTcrZKgwjjXmHTIgcoaCCWEs7rEk1aQztobZb8CO/V1pMo7z3dcAYuW9vGhZuAeGLqTMlw+7x7pk4h+afduTefl8j1ZPPUBmLnkYkn6mQAsh+Y/gB8RMg8Xvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875916; c=relaxed/simple;
	bh=TmKVtcwWloXteoZNc/4LiFCiMh6lpFClekeZgK0z80A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FZ3qpRkWa9HHBxVnGjkzJ/xbclrdLIflRGAmxE86mCqz8qpLzvrDJiAR8soOpE9LcwSBmh9zNTWaA/I+BcCbyJPuFkFeSeAJeuaWuIi5uc/bb0bU3rR16sG8E9aZNp4CH2PTY0Fvjk96mneQlEZZrjpW+JFB6uNz/F/2g24BEX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=dEvwb59u; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="dEvwb59u"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BG94psZ63635992, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765875891; bh=GmZmlEMCIEpvJXxaeLe6L/N4IU60Rwn8KcEZMEJRxqU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=dEvwb59u3qFDoBgRL61mzzpyvY9R5rFrxIIvv4GoQgVoYZmvIBC8Zrs8rsKN2jGa7
	 g/9piZly0ETQ7UEcwvCigCHa/rnTiJPztfOZioUANRZeEDBTzRzIQXMEEYGmJcZIMx
	 7HUvtsXDlBRtHYCwIvxW50JW8KVXoiT6TAq8ikfl5qIHPRyOVfcTupHl0I1keW91IA
	 XJhiIrfjMzPCKODud22hiOsd1CC4LKC5Da7RXJJ3M7Ykv5HhQbKBnH2/ebBkod5Jc6
	 cNqiNcsqzYW/p5hN0hD+XZi7XqtJx53ZHxx20GquIzJe3KkTptvn4qgG7KPn8XF8Tc
	 MXEHhKriLClmw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BG94psZ63635992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 17:04:51 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 16 Dec 2025 17:04:50 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 16 Dec 2025 17:04:50 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/3] ASoC: rt1320: support calibration and temperature/r0 loading
Date: Tue, 16 Dec 2025 17:06:16 +0800
Message-ID: <20251216090616.3955293-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

This patch adds the functions/controls to support the calibration.
The mixer controls could trigger a calibration and load temperature/r0 value.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 1059 ++++++++++++++++++++++++++++++++-
 sound/soc/codecs/rt1320-sdw.h |   66 ++
 2 files changed, 1118 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index feecef258b65..1c5cb8a8c699 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -500,12 +500,8 @@ static bool rt1320_readable_register(struct device *dev, unsigned int reg)
 	case 0x2000301c:
 	case 0x2000900f:
 	case 0x20009018:
-	case 0x3fc29d80 ... 0x3fc29d83:
-	case 0x3fe2e000 ... 0x3fe2e003:
-	case 0x3fc2ab80 ... 0x3fc2abd4:
-	case 0x3fc2bfc0 ... 0x3fc2bfc8:
-	case 0x3fc2d300 ... 0x3fc2d354:
-	case 0x3fc2dfc0 ... 0x3fc2dfc8:
+	case 0x3fc000c0 ... 0x3fc2dfc8:
+	case 0x3fe00000 ... 0x3fe36fff:
 	/* 0x40801508/0x40801809/0x4080180a/0x40801909/0x4080190a */
 	case SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, RT1320_SDCA_CTL_REQ_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_MUTE, CH_01):
@@ -555,6 +551,8 @@ static bool rt1320_volatile_register(struct device *dev, unsigned int reg)
 	case 0xc48c ... 0xc48f:
 	case 0xc560:
 	case 0xc5b5 ... 0xc5b7:
+	case 0xc5c3:
+	case 0xc5c8:
 	case 0xc5fc ... 0xc5ff:
 	case 0xc680 ... 0xc683:
 	case 0xc820:
@@ -588,6 +586,7 @@ static bool rt1320_volatile_register(struct device *dev, unsigned int reg)
 	case 0xdd0c ... 0xdd13:
 	case 0xde02:
 	case 0xdf14 ... 0xdf1b:
+	case 0xe80b:
 	case 0xe83c ... 0xe847:
 	case 0xf01e:
 	case 0xf717 ... 0xf719:
@@ -600,7 +599,7 @@ static bool rt1320_volatile_register(struct device *dev, unsigned int reg)
 	case 0x2000301c:
 	case 0x2000900f:
 	case 0x20009018:
-	case 0x3fc2ab80 ... 0x3fc2abd4:
+	case 0x3fc2ab80 ... 0x3fc2ac4c:
 	case 0x3fc2b780:
 	case 0x3fc2bf80 ... 0x3fc2bf83:
 	case 0x3fc2bfc0 ... 0x3fc2bfc8:
@@ -718,6 +717,13 @@ static int rt1320_read_prop(struct sdw_slave *slave)
 		j++;
 	}
 
+	prop->dp0_prop = devm_kzalloc(&slave->dev, sizeof(*prop->dp0_prop), GFP_KERNEL);
+	if (!prop->dp0_prop)
+		return -ENOMEM;
+
+	prop->dp0_prop->simple_ch_prep_sm = true;
+	prop->dp0_prop->ch_prep_timeout = 10;
+
 	/* set the timeout values */
 	prop->clk_stop_timeout = 64;
 
@@ -752,6 +758,515 @@ static int rt1320_pde_transition_delay(struct rt1320_sdw_priv *rt1320, unsigned
 	return 0;
 }
 
+static void rt1320_data_rw(struct rt1320_sdw_priv *rt1320, unsigned int start,
+			   unsigned char *data, unsigned int size, enum rt1320_rw_type rw)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned int tmp;
+	int ret = -1;
+	int i, j;
+
+	pm_runtime_set_autosuspend_delay(dev, 20000);
+	pm_runtime_mark_last_busy(dev);
+
+	switch (rw) {
+	case RT1320_BRA_WRITE:
+	case RT1320_BRA_READ:
+		ret = sdw_bpt_send_sync(rt1320->sdw_slave->bus, rt1320->sdw_slave, &rt1320->bra_msg);
+		if (ret < 0)
+			dev_err(dev, "%s: Failed to send BRA message: %d\n", __func__, ret);
+		fallthrough;
+	case RT1320_PARAM_WRITE:
+	case RT1320_PARAM_READ:
+		if (ret < 0) {
+			/* if BRA fails, we try to access by the control word */
+			if (rw == RT1320_BRA_WRITE || rw == RT1320_BRA_READ) {
+				for (i = 0; i < rt1320->bra_msg.sections; i++) {
+					pm_runtime_mark_last_busy(dev);
+					for (j = 0; j < rt1320->bra_msg.sec[i].len; j++) {
+						if (rw == RT1320_BRA_WRITE) {
+							regmap_write(rt1320->regmap,
+								rt1320->bra_msg.sec[i].addr + j, rt1320->bra_msg.sec[i].buf[j]);
+						} else {
+							regmap_read(rt1320->regmap, rt1320->bra_msg.sec[i].addr + j, &tmp);
+							rt1320->bra_msg.sec[i].buf[j] = tmp;
+						}
+					}
+				}
+			} else {
+				for (i = 0; i < size; i++) {
+					if (rw == RT1320_PARAM_WRITE)
+						regmap_write(rt1320->regmap, start + i, data[i]);
+					else {
+						regmap_read(rt1320->regmap, start + i, &tmp);
+						data[i] = tmp;
+					}
+				}
+			}
+		}
+		break;
+	}
+
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_mark_last_busy(dev);
+}
+
+static unsigned long long rt1320_rsgain_to_rsratio(struct rt1320_sdw_priv *rt1320, unsigned int rsgain)
+{
+	unsigned long long base = 1000000000U;
+	unsigned long long step = 1960784U;
+	unsigned long long tmp, result;
+
+	if (rsgain == 0 || rsgain == 0x1ff)
+		result = 1000000000;
+	else if (rsgain & 0x100) {
+		tmp = 0xff - (rsgain & 0xff);
+		tmp = tmp * step;
+		result =  base + tmp;
+	} else {
+		tmp = (rsgain & 0xff);
+		tmp = tmp * step;
+		result = base - tmp;
+	}
+
+	return result;
+}
+
+static void rt1320_pr_read(struct rt1320_sdw_priv *rt1320, unsigned int reg, unsigned int *val)
+{
+	unsigned int byte3, byte2, byte1, byte0;
+
+	regmap_write(rt1320->regmap, 0xc483, 0x80);
+	regmap_write(rt1320->regmap, 0xc482, 0x40);
+	regmap_write(rt1320->regmap, 0xc481, 0x0c);
+	regmap_write(rt1320->regmap, 0xc480, 0x10);
+
+	regmap_write(rt1320->regmap, 0xc487, ((reg & 0xff000000) >> 24));
+	regmap_write(rt1320->regmap, 0xc486, ((reg & 0x00ff0000) >> 16));
+	regmap_write(rt1320->regmap, 0xc485, ((reg & 0x0000ff00) >> 8));
+	regmap_write(rt1320->regmap, 0xc484, (reg & 0x000000ff));
+
+	regmap_write(rt1320->regmap, 0xc482, 0xc0);
+
+	regmap_read(rt1320->regmap, 0xc48f, &byte3);
+	regmap_read(rt1320->regmap, 0xc48e, &byte2);
+	regmap_read(rt1320->regmap, 0xc48d, &byte1);
+	regmap_read(rt1320->regmap, 0xc48c, &byte0);
+
+	*val = (byte3 << 24) | (byte2 << 16) | (byte1 << 8) | byte0;
+}
+
+static int rt1320_check_fw_ready(struct rt1320_sdw_priv *rt1320)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned int tmp, retry = 0;
+	unsigned int cmd_addr;
+
+	switch (rt1320->dev_id) {
+	case RT1320_DEV_ID:
+		cmd_addr = RT1320_CMD_ID;
+		break;
+	case RT1321_DEV_ID:
+		cmd_addr = RT1321_CMD_ID;
+		break;
+	default:
+		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+		return -EINVAL;
+	}
+
+	pm_runtime_mark_last_busy(dev);
+	/* check the value of cmd_addr becomes to zero */
+	while (retry < 500) {
+		regmap_read(rt1320->regmap, cmd_addr, &tmp);
+		if (tmp == 0)
+			break;
+		usleep_range(1000, 1100);
+		retry++;
+	}
+	if (retry == 500) {
+		dev_warn(dev, "%s FW is NOT ready!", __func__);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int rt1320_check_power_state_ready(struct rt1320_sdw_priv *rt1320, enum rt1320_power_state ps)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned int retry = 0, tmp;
+
+	pm_runtime_mark_last_busy(dev);
+	while (retry < 200) {
+		regmap_read(rt1320->regmap, RT1320_POWER_STATE, &tmp);
+		dev_dbg(dev, "%s, RT1320_POWER_STATE=0x%x\n", __func__, tmp);
+		if (tmp >= ps)
+			break;
+		usleep_range(1000, 1500);
+		retry++;
+	}
+	if (retry == 200) {
+		dev_warn(dev, "%s FW Power State is NOT ready!", __func__);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int rt1320_process_fw_param(struct rt1320_sdw_priv *rt1320, unsigned char *buf, unsigned int buf_size)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	struct rt1320_paramcmd *paramhr = (struct rt1320_paramcmd *)buf;
+	unsigned char moudleid = paramhr->moudleid;
+	unsigned char cmdtype = paramhr->commandtype;
+	unsigned int fw_param_addr;
+	unsigned int start_addr;
+	int ret = 0;
+
+	switch (rt1320->dev_id) {
+	case RT1320_DEV_ID:
+		fw_param_addr = RT1320_FW_PARAM_ADDR;
+		start_addr = RT1320_CMD_PARAM_ADDR;
+		break;
+	case RT1321_DEV_ID:
+		fw_param_addr = RT1321_FW_PARAM_ADDR;
+		start_addr = RT1321_CMD_PARAM_ADDR;
+		break;
+	default:
+		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+		return -EINVAL;
+	}
+
+	ret = rt1320_check_fw_ready(rt1320);
+	if (ret < 0)
+		goto _timeout_;
+
+	/* don't set offset 0x0/0x1, it will be set later*/
+	paramhr->moudleid = 0;
+	paramhr->commandtype = 0;
+	rt1320_data_rw(rt1320, fw_param_addr, buf, buf_size, RT1320_PARAM_WRITE);
+
+	dev_dbg(dev, "%s, moudleid=%d, cmdtype=%d, paramid=%d, paramlength=%d\n", __func__,
+		moudleid, cmdtype, paramhr->paramid, paramhr->paramlength);
+
+	if (cmdtype == RT1320_SET_PARAM) {
+		regmap_write(rt1320->regmap, fw_param_addr, moudleid);
+		regmap_write(rt1320->regmap, fw_param_addr + 1, 0x01);
+	}
+	if (cmdtype == RT1320_GET_PARAM) {
+		regmap_write(rt1320->regmap, fw_param_addr, moudleid);
+		regmap_write(rt1320->regmap, fw_param_addr + 1, 0x02);
+		ret = rt1320_check_fw_ready(rt1320);
+		if (ret < 0)
+			goto _timeout_;
+
+		rt1320_data_rw(rt1320, start_addr, buf + 0x10, paramhr->commandlength, RT1320_PARAM_READ);
+	}
+	return 0;
+
+_timeout_:
+	dev_err(&rt1320->sdw_slave->dev, "%s: FW is NOT ready for SET/GET_PARAM\n", __func__);
+	return ret;
+}
+
+static int rt1320_fw_param_protocol(struct rt1320_sdw_priv *rt1320, enum rt1320_fw_cmdid cmdid,
+				    unsigned int paramid, void *parambuf, unsigned int paramsize)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned char *tempbuf = NULL;
+	struct rt1320_paramcmd paramhr;
+	int ret = 0;
+
+	tempbuf = kzalloc(sizeof(paramhr) + paramsize, GFP_KERNEL);
+	if (!tempbuf)
+		return -ENOMEM;
+
+	paramhr.moudleid = 1;
+	paramhr.commandtype = cmdid;
+	/* 8 is "sizeof(paramid) + sizeof(paramlength)" */
+	paramhr.commandlength = 8 + paramsize;
+	paramhr.paramid = paramid;
+	paramhr.paramlength = paramsize;
+
+	memcpy(tempbuf, &paramhr, sizeof(paramhr));
+	if (cmdid == RT1320_SET_PARAM)
+		memcpy(tempbuf + sizeof(paramhr), parambuf, paramsize);
+
+	ret = rt1320_process_fw_param(rt1320, tempbuf, sizeof(paramhr) + paramsize);
+	if (ret < 0) {
+		dev_err(dev, "%s: process_fw_param failed\n", __func__);
+		goto _finish_;
+	}
+
+	if (cmdid == RT1320_GET_PARAM)
+		memcpy(parambuf, tempbuf + sizeof(paramhr), paramsize);
+
+_finish_:
+	kfree(tempbuf);
+	return ret;
+}
+
+static void rt1320_set_advancemode(struct rt1320_sdw_priv *rt1320)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	struct rt1320_datafixpoint r0_data[2];
+	unsigned short l_advancegain, r_advancegain;
+	int ret;
+
+	/* Get advance gain/r0 */
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 6, &r0_data[0], sizeof(struct rt1320_datafixpoint));
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 7, &r0_data[1], sizeof(struct rt1320_datafixpoint));
+	l_advancegain = r0_data[0].advancegain;
+	r_advancegain = r0_data[1].advancegain;
+	dev_dbg(dev, "%s, LR advanceGain=0x%x 0x%x\n", __func__, l_advancegain, r_advancegain);
+
+	/* set R0 and enable protection by SetParameter id 6, 7 */
+	r0_data[0].silencedetect = 0;
+	r0_data[0].r0 = rt1320->r0_l_reg;
+	r0_data[1].silencedetect = 0;
+	r0_data[1].r0 = rt1320->r0_r_reg;
+	dev_dbg(dev, "%s, write LR r0=%d, %d\n", __func__, r0_data[0].r0, r0_data[1].r0);
+
+	rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 6, &r0_data[0], sizeof(struct rt1320_datafixpoint));
+	rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 7, &r0_data[1], sizeof(struct rt1320_datafixpoint));
+	ret = rt1320_check_fw_ready(rt1320);
+	if (ret < 0)
+		dev_err(dev, "%s: Failed to set FW param 6,7!\n", __func__);
+
+	if (l_advancegain != 0 && r_advancegain != 0) {
+		regmap_write(rt1320->regmap, 0xdd0b, (l_advancegain & 0xff00) >> 8);
+		regmap_write(rt1320->regmap, 0xdd0a, (l_advancegain & 0xff));
+		regmap_write(rt1320->regmap, 0xdd09, (r_advancegain & 0xff00) >> 8);
+		regmap_write(rt1320->regmap, 0xdd08, (r_advancegain & 0xff));
+		dev_dbg(dev, "%s, set Advance mode gain\n", __func__);
+	}
+}
+
+static int rt1320_invrs_load(struct rt1320_sdw_priv *rt1320)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned long long l_rsratio, r_rsratio;
+	unsigned int pr_1058, pr_1059, pr_105a;
+	unsigned long long l_invrs, r_invrs;
+	unsigned long long factor = (1 << 28);
+	unsigned int l_rsgain, r_rsgain;
+	struct rt1320_datafixpoint r0_data[2];
+	int ret;
+
+	/* read L/Rch Rs Gain - it uses for compensating the R0 value */
+	rt1320_pr_read(rt1320, 0x1058, &pr_1058);
+	rt1320_pr_read(rt1320, 0x1059, &pr_1059);
+	rt1320_pr_read(rt1320, 0x105a, &pr_105a);
+	l_rsgain = ((pr_1059 & 0x7f) << 2) | ((pr_105a & 0xc0) >> 6);
+	r_rsgain = ((pr_1058 & 0xff) << 1) | ((pr_1059 & 0x80) >> 7);
+	dev_dbg(dev, "%s, LR rsgain=0x%x, 0x%x\n", __func__, l_rsgain, r_rsgain);
+
+	l_rsratio = rt1320_rsgain_to_rsratio(rt1320, l_rsgain);
+	r_rsratio = rt1320_rsgain_to_rsratio(rt1320, r_rsgain);
+	dev_dbg(dev, "%s, LR rsratio=%lld, %lld\n", __func__, l_rsratio, r_rsratio);
+
+	l_invrs = (l_rsratio * factor) / 1000000000U;
+	r_invrs = (r_rsratio * factor) / 1000000000U;
+
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 6, &r0_data[0], sizeof(struct rt1320_datafixpoint));
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 7, &r0_data[1], sizeof(struct rt1320_datafixpoint));
+
+	r0_data[0].invrs = l_invrs;
+	r0_data[1].invrs = r_invrs;
+	dev_dbg(dev, "%s, write DSP LR invrs=0x%x, 0x%x\n", __func__, r0_data[0].invrs, r0_data[1].invrs);
+
+	rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 6, &r0_data[0], sizeof(struct rt1320_datafixpoint));
+	rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 7, &r0_data[1], sizeof(struct rt1320_datafixpoint));
+	ret = rt1320_check_fw_ready(rt1320);
+	if (ret < 0)
+		dev_err(dev, "%s: Failed to set FW param 6,7!\n", __func__);
+
+	return ret;
+}
+
+static void rt1320_calc_r0(struct rt1320_sdw_priv *rt1320)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned long long l_calir0, r_calir0;
+	const unsigned int factor = (1 << 27);
+
+	l_calir0 = (rt1320->r0_l_reg * 1000) / factor;
+	r_calir0 = (rt1320->r0_r_reg * 1000) / factor;
+
+	dev_dbg(dev, "%s, l_calir0=%lld.%03lld ohm, r_calir0=%lld.%03lld ohm\n", __func__,
+		l_calir0 / 1000, l_calir0 % 1000,
+		r_calir0 / 1000, r_calir0 % 1000);
+}
+
+static void rt1320_calibrate(struct rt1320_sdw_priv *rt1320)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	struct rt1320_datafixpoint audfixpoint[2];
+	unsigned int reg_c5fb, reg_c570, reg_cd00;
+	unsigned int vol_reg[4], fw_ready;
+	unsigned long long l_meanr0, r_meanr0;
+	unsigned int fw_status_addr;
+	int l_re[5], r_re[5];
+	int ret, tmp;
+	unsigned long long factor = (1 << 27);
+	unsigned short l_advancegain, r_advancegain;
+	unsigned int delay_s = 7; /* delay seconds for the calibration */
+
+	if (!rt1320->component)
+		return;
+
+	switch (rt1320->dev_id) {
+	case RT1320_DEV_ID:
+		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
+		break;
+	case RT1321_DEV_ID:
+		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
+		break;
+	default:
+		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+		return;
+	}
+
+	/* set volume 0dB */
+	regmap_read(rt1320->regmap, 0xdd0b, &vol_reg[3]);
+	regmap_read(rt1320->regmap, 0xdd0a, &vol_reg[2]);
+	regmap_read(rt1320->regmap, 0xdd09, &vol_reg[1]);
+	regmap_read(rt1320->regmap, 0xdd08, &vol_reg[0]);
+	regmap_write(rt1320->regmap, 0xdd0b, 0x0f);
+	regmap_write(rt1320->regmap, 0xdd0a, 0xff);
+	regmap_write(rt1320->regmap, 0xdd09, 0x0f);
+	regmap_write(rt1320->regmap, 0xdd08, 0xff);
+
+	regmap_read(rt1320->regmap, 0xc5fb, &reg_c5fb);
+	regmap_read(rt1320->regmap, 0xc570, &reg_c570);
+	regmap_read(rt1320->regmap, 0xcd00, &reg_cd00);
+
+	regmap_write(rt1320->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
+	ret = rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
+	if (ret < 0) {
+		dev_dbg(dev, "%s, PDE=PS0 is NOT ready\n", __func__);
+		goto _finish_;
+	}
+
+	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
+	fw_ready &= 0x1;
+	if (!fw_ready) {
+		dev_dbg(dev, "%s, DSP FW is NOT ready. Please load DSP FW first\n", __func__);
+		goto _finish_;
+	}
+
+	ret = rt1320_check_power_state_ready(rt1320, RT1320_NORMAL_STATE);
+	if (ret < 0) {
+		dev_dbg(dev, "%s, DSP FW PS is NOT ready\n", __func__);
+		goto _finish_;
+	}
+
+	if (rt1320->dev_id == RT1320_DEV_ID)
+		regmap_write(rt1320->regmap, 0xc5fb, 0x00);
+	regmap_write(rt1320->regmap, 0xc570, 0x0b);
+	regmap_write(rt1320->regmap, 0xcd00, 0xc5);
+
+	/* disable silence detection */
+	regmap_update_bits(rt1320->regmap, 0xc044, 0xe0, 0x00);
+	dev_dbg(dev, "%s, disable silence detection\n", __func__);
+
+	ret = rt1320_check_power_state_ready(rt1320, RT1320_K_R0_STATE);
+	if (ret < 0) {
+		dev_dbg(dev, "%s, check class D status before k r0\n", __func__);
+		goto _finish_;
+	}
+
+	for (tmp = 0; tmp < delay_s; tmp++) {
+		msleep(1000);
+		pm_runtime_mark_last_busy(dev);
+
+		rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 11, &l_re[0], sizeof(l_re));
+		rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 12, &r_re[0], sizeof(r_re));
+
+		dev_dbg(dev, "%s, LR re=0x%x, 0x%x\n", __func__, l_re[4], r_re[4]);
+		dev_dbg(dev, "%s, waiting for calibration R0...%d seconds\n", __func__, tmp + 1);
+	}
+
+	/* Get Calibration data */
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 11, &l_re[0], sizeof(l_re));
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 12, &r_re[0], sizeof(r_re));
+	dev_dbg(dev, "%s, LR re=0x%x, 0x%x\n", __func__, l_re[4], r_re[4]);
+
+	/* Get advance gain/mean r0 */
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 6, &audfixpoint[0], sizeof(struct rt1320_datafixpoint));
+	l_meanr0 = audfixpoint[0].meanr0;
+	l_advancegain = audfixpoint[0].advancegain;
+	l_meanr0 = ((l_meanr0 * 1000U) / factor);
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 7, &audfixpoint[1], sizeof(struct rt1320_datafixpoint));
+	r_meanr0 = audfixpoint[1].meanr0;
+	r_advancegain = audfixpoint[1].advancegain;
+	r_meanr0 = ((r_meanr0 * 1000U) / factor);
+	dev_dbg(dev, "%s, LR meanr0=%lld, %lld\n", __func__, l_meanr0, r_meanr0);
+	dev_dbg(dev, "%s, LR advanceGain=0x%x, 0x%x\n", __func__, l_advancegain, r_advancegain);
+	dev_dbg(dev, "%s, LR invrs=0x%x, 0x%x\n", __func__, audfixpoint[0].invrs, audfixpoint[1].invrs);
+
+	/* enable silence detection */
+	regmap_update_bits(rt1320->regmap, 0xc044, 0xe0, 0xe0);
+	dev_dbg(dev, "%s, enable silence detection\n", __func__);
+
+	regmap_write(rt1320->regmap, 0xc5fb, reg_c5fb);
+	regmap_write(rt1320->regmap, 0xc570, reg_c570);
+	regmap_write(rt1320->regmap, 0xcd00, reg_cd00);
+
+	rt1320->r0_l_reg = l_re[4];
+	rt1320->r0_r_reg = r_re[4];
+	rt1320->cali_done = true;
+	rt1320_calc_r0(rt1320);
+
+_finish_:
+	regmap_write(rt1320->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
+	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
+
+	/* advance gain will be set when R0 load, not here */
+	regmap_write(rt1320->regmap, 0xdd0b, vol_reg[3]);
+	regmap_write(rt1320->regmap, 0xdd0a, vol_reg[2]);
+	regmap_write(rt1320->regmap, 0xdd09, vol_reg[1]);
+	regmap_write(rt1320->regmap, 0xdd08, vol_reg[0]);
+}
+
+static int rt1320_r0_cali_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1320->cali_done;
+	return 0;
+}
+
+static int rt1320_r0_cali_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
+	int ret;
+
+	if (!rt1320->hw_init)
+		return 0;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	rt1320->cali_done = false;
+	snd_soc_dapm_mutex_lock(dapm);
+	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
+		ucontrol->value.integer.value[0]) {
+		rt1320_calibrate(rt1320);
+	}
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 0;
+}
+
 /*
  * The 'patch code' is written to the patch code area.
  * The patch code area is used for SDCA register expansion flexibility.
@@ -842,6 +1357,301 @@ static void rt1320_vab_preset(struct rt1320_sdw_priv *rt1320)
 	}
 }
 
+static int rt1320_t0_load(struct rt1320_sdw_priv *rt1320, unsigned int l_t0, unsigned int r_t0)
+{
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned int factor = (1 << 22), fw_ready;
+	int l_t0_data[38], r_t0_data[38];
+	unsigned int fw_status_addr;
+	int ret;
+
+	switch (rt1320->dev_id) {
+	case RT1320_DEV_ID:
+		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
+		break;
+	case RT1321_DEV_ID:
+		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
+		break;
+	default:
+		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+		return -EINVAL;
+	}
+
+	regmap_write(rt1320->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
+				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
+	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
+
+	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
+	fw_ready &= 0x1;
+	if (!fw_ready) {
+		dev_warn(dev, "%s, DSP FW is NOT ready\n", __func__);
+		goto _exit_;
+	}
+
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 3, &l_t0_data[0], sizeof(l_t0_data));
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 4, &r_t0_data[0], sizeof(r_t0_data));
+
+	l_t0_data[37] = l_t0 * factor;
+	r_t0_data[37] = r_t0 * factor;
+
+	dev_dbg(dev, "%s, write LR t0=0x%x, 0x%x\n", __func__, l_t0_data[37], r_t0_data[37]);
+
+	rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 3, &l_t0_data[0], sizeof(l_t0_data));
+	rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 4, &r_t0_data[0], sizeof(r_t0_data));
+	ret = rt1320_check_fw_ready(rt1320);
+	if (ret < 0)
+		dev_err(dev, "%s: Failed to set FW param 3,4!\n", __func__);
+
+	rt1320->temp_l_calib = l_t0;
+	rt1320->temp_r_calib = r_t0;
+
+	memset(&l_t0_data[0], 0x00, sizeof(l_t0_data));
+	memset(&r_t0_data[0], 0x00, sizeof(r_t0_data));
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 3, &l_t0_data[0], sizeof(l_t0_data));
+	rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 4, &r_t0_data[0], sizeof(r_t0_data));
+	dev_dbg(dev, "%s, read after writing LR t0=0x%x, 0x%x\n", __func__, l_t0_data[37], r_t0_data[37]);
+
+_exit_:
+	regmap_write(rt1320->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
+				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
+	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
+
+	return ret;
+}
+
+static void rt1320_dspfw_load_code(struct rt1320_sdw_priv *rt1320)
+{
+struct rt1320_imageinfo {
+	unsigned int addr;
+	unsigned int size;
+};
+
+struct rt1320_dspfwheader {
+	unsigned int sync;
+	short num;
+	short crc;
+};
+
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(rt1320->component);
+	struct device *dev = &rt1320->sdw_slave->dev;
+	unsigned int val, i, fw_offset, fw_ready;
+	unsigned int fw_status_addr;
+	struct rt1320_dspfwheader *fwheader;
+	struct rt1320_imageinfo *ptr_img;
+	struct sdw_bpt_section sec[10];
+	const struct firmware *fw = NULL;
+	unsigned char *fw_data;
+	bool dev_fw_match = false;
+	static const char hdr_sig[] = "AFX";
+	unsigned int hdr_size = 0;
+	const char *dmi_vendor, *dmi_product, *dmi_sku;
+	char vendor[128], product[128], sku[128];
+	char *ptr_vendor, *ptr_product, *ptr_sku;
+	char filename[128];
+
+	switch (rt1320->dev_id) {
+	case RT1320_DEV_ID:
+		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
+		break;
+	case RT1321_DEV_ID:
+		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
+		break;
+	default:
+		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+		return;
+	}
+
+	dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
+	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+
+	if (dmi_vendor && dmi_product && dmi_sku) {
+		strscpy(vendor, dmi_vendor);
+		strscpy(product, dmi_product);
+		strscpy(sku, dmi_sku);
+		ptr_vendor = &vendor[0];
+		ptr_product = &product[0];
+		ptr_sku = &sku[0];
+		ptr_vendor = strsep(&ptr_vendor, " ");
+		ptr_product = strsep(&ptr_product, " ");
+		ptr_sku = strsep(&ptr_sku, " ");
+
+		dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
+			vendor, product, sku);
+
+		snprintf(filename, sizeof(filename),
+			 "realtek/rt1320/rt1320_%s_%s_%s.dat", vendor, product, sku);
+		dev_dbg(dev, "%s: try to load FW file %s\n", __func__, filename);
+	} else if (rt1320->dspfw_name) {
+		snprintf(filename, sizeof(filename), "rt1320_%s.dat",
+			 rt1320->dspfw_name);
+		dev_dbg(dev, "%s: try to load FW file %s\n", __func__, filename);
+	} else {
+		dev_warn(dev, "%s: Can't find proper FW file name\n", __func__);
+		return;
+	}
+
+	snd_soc_dapm_mutex_lock(dapm);
+	regmap_write(rt1320->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
+				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
+	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
+
+	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
+	fw_ready &= 0x1;
+	if (fw_ready) {
+		dev_dbg(dev, "%s, DSP FW was already\n", __func__);
+		rt1320->fw_load_done = true;
+		goto _exit_;
+	}
+
+	/* change to IRAM */
+	regmap_update_bits(rt1320->regmap, 0xf01e, 0x80, 0x00);
+
+	request_firmware(&fw, filename, dev);
+	if (fw) {
+		fwheader = (struct rt1320_dspfwheader *)fw->data;
+		dev_dbg(dev, "%s, fw sync = 0x%x, num=%d, crc=0x%x\n", __func__,
+			fwheader->sync, fwheader->num, fwheader->crc);
+
+		if (fwheader->sync != 0x0a1c5679) {
+			dev_err(dev, "%s: FW sync error\n", __func__);
+			release_firmware(fw);
+			goto _exit_;
+		}
+
+		fw_offset = sizeof(struct rt1320_dspfwheader) + (sizeof(struct rt1320_imageinfo) * fwheader->num);
+		dev_dbg(dev, "%s, fw_offset = 0x%x\n", __func__, fw_offset);
+
+		regcache_cache_bypass(rt1320->regmap, true);
+
+		for (i = 0; i < fwheader->num; i++) {
+			ptr_img = (struct rt1320_imageinfo *)&fw->data[sizeof(struct rt1320_dspfwheader) + (sizeof(struct rt1320_imageinfo) * i)];
+
+			dev_dbg(dev, "%s, fw_offset=0x%x, load fw addr=0x%x, size=%d\n", __func__,
+				fw_offset, ptr_img->addr, ptr_img->size);
+
+			fw_data = (unsigned char *)&fw->data[fw_offset];
+
+			/* The binary file has a header of 64 bytes */
+			if (memcmp(fw_data, hdr_sig, sizeof(hdr_sig)) == 0)
+				hdr_size = 64;
+			else
+				hdr_size = 0;
+
+			sec[i].addr = ptr_img->addr;
+			sec[i].len = ptr_img->size - hdr_size;
+			sec[i].buf = fw_data + hdr_size;
+
+			dev_dbg(dev, "%s, hdr_size=%d, sec[%d].buf[0]=0x%x\n",
+				__func__, hdr_size, i, sec[i].buf[0]);
+
+			switch (rt1320->dev_id) {
+			case RT1320_DEV_ID:
+				if (ptr_img->addr == 0x3fc29d80)
+					if (fw_data[9] == '0')
+						dev_fw_match = true;
+				break;
+			case RT1321_DEV_ID:
+				if (ptr_img->addr == 0x3fc00000)
+					if (fw_data[9] == '1')
+						dev_fw_match = true;
+				break;
+			default:
+				dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+				goto _exit_;
+			}
+
+			fw_offset += ptr_img->size;
+		}
+
+		if (dev_fw_match) {
+			dev_dbg(dev, "%s, starting BRA downloading FW..\n", __func__);
+			rt1320->bra_msg.dev_num = rt1320->sdw_slave->dev_num;
+			rt1320->bra_msg.flags = SDW_MSG_FLAG_WRITE;
+			rt1320->bra_msg.sections = fwheader->num;
+			rt1320->bra_msg.sec = &sec[0];
+			rt1320_data_rw(rt1320, 0, NULL, 0, RT1320_BRA_WRITE);
+			dev_dbg(dev, "%s, BRA downloading FW done..\n", __func__);
+		}
+
+		regcache_cache_bypass(rt1320->regmap, false);
+		release_firmware(fw);
+
+		if (!dev_fw_match) {
+			dev_err(dev, "%s: FW file doesn't match to device\n", __func__);
+			goto _exit_;
+		}
+	} else {
+		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, filename);
+		goto _exit_;
+	}
+
+	/* run RAM code */
+	regmap_read(rt1320->regmap, 0x3fc2bfc0, &val);
+	val |= 0x8;
+	regmap_write(rt1320->regmap, 0x3fc2bfc0, val);
+
+	/* clear frame counter */
+	switch (rt1320->dev_id) {
+	case RT1320_DEV_ID:
+		regmap_write(rt1320->regmap, 0x3fc2bfcb, 0x00);
+		regmap_write(rt1320->regmap, 0x3fc2bfca, 0x00);
+		regmap_write(rt1320->regmap, 0x3fc2bfc9, 0x00);
+		regmap_write(rt1320->regmap, 0x3fc2bfc8, 0x00);
+		break;
+	case RT1321_DEV_ID:
+		regmap_write(rt1320->regmap, 0x3fc2dfcb, 0x00);
+		regmap_write(rt1320->regmap, 0x3fc2dfca, 0x00);
+		regmap_write(rt1320->regmap, 0x3fc2dfc9, 0x00);
+		regmap_write(rt1320->regmap, 0x3fc2dfc8, 0x00);
+		break;
+	}
+
+	/* enable DSP FW */
+	regmap_write(rt1320->regmap, 0xc081, 0xfc);
+	regmap_update_bits(rt1320->regmap, 0xf01e, 0x1, 0x0);
+
+	/* RsRatio should restore into DSP FW when FW was ready */
+	rt1320_invrs_load(rt1320);
+
+	/* DSP clock switches to PLL */
+	regmap_write(rt1320->regmap, 0xc081, 0xfc);
+	/* pass DSP settings */
+	regmap_write(rt1320->regmap, 0xc5c3, 0xf3);
+	regmap_write(rt1320->regmap, 0xc5c8, 0x05);
+
+	rt1320->fw_load_done = true;
+
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_mark_last_busy(dev);
+
+_exit_:
+	regmap_write(rt1320->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
+				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
+	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
+
+	snd_soc_dapm_mutex_unlock(dapm);
+}
+
+static void rt1320_load_dspfw_work(struct work_struct *work)
+{
+	struct rt1320_sdw_priv *rt1320 =
+		container_of(work, struct rt1320_sdw_priv, load_dspfw_work);
+	int ret;
+
+	ret = pm_runtime_resume(rt1320->component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return;
+
+	dev_dbg(&rt1320->sdw_slave->dev, "%s, Starting to reload DSP FW", __func__);
+	rt1320_dspfw_load_code(rt1320);
+}
+
 static void rt1320_vc_preset(struct rt1320_sdw_priv *rt1320)
 {
 	struct sdw_slave *slave = rt1320->sdw_slave;
@@ -954,6 +1764,10 @@ static int rt1320_io_init(struct device *dev, struct sdw_slave *slave)
 		regmap_write(rt1320->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT0, RT1320_SDCA_CTL_FUNC_STATUS, 0),
 			FUNCTION_NEEDS_INITIALIZATION);
+
+		/* reload DSP FW */
+		if (rt1320->fw_load_done)
+			schedule_work(&rt1320->load_dspfw_work);
 	}
 	if (!rt1320->first_hw_init && rt1320->version_id == RT1320_VA && rt1320->dev_id == RT1320_DEV_ID) {
 		regmap_write(rt1320->regmap, SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
@@ -1356,6 +2170,189 @@ static SOC_ENUM_SINGLE_DECL(rt1320_rx_data_ch_enum,
 static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
 static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
 
+static int rt1320_r0_load(struct rt1320_sdw_priv *rt1320)
+{
+	struct device *dev = regmap_get_device(rt1320->regmap);
+	unsigned int fw_status_addr;
+	unsigned int fw_ready;
+	int ret = 0;
+
+	if (!rt1320->r0_l_reg || !rt1320->r0_r_reg)
+		return -EINVAL;
+
+	switch (rt1320->dev_id) {
+	case RT1320_DEV_ID:
+		fw_status_addr = RT1320_DSPFW_STATUS_ADDR;
+		break;
+	case RT1321_DEV_ID:
+		fw_status_addr = RT1321_DSPFW_STATUS_ADDR;
+		break;
+	default:
+		dev_err(dev, "%s: Unknown device ID %d\n", __func__, rt1320->dev_id);
+		return -EINVAL;
+	}
+
+	regmap_write(rt1320->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
+	ret = rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
+	if (ret < 0) {
+		dev_dbg(dev, "%s, PDE=PS0 is NOT ready\n", __func__);
+		goto _timeout_;
+	}
+
+	regmap_read(rt1320->regmap, fw_status_addr, &fw_ready);
+	fw_ready &= 0x1;
+	if (!fw_ready) {
+		dev_dbg(dev, "%s, DSP FW is NOT ready\n", __func__);
+		goto _timeout_;
+	}
+
+	ret = rt1320_check_power_state_ready(rt1320, RT1320_NORMAL_STATE);
+	if (ret < 0) {
+		dev_dbg(dev, "%s, DSP FW PS is NOT ready\n", __func__);
+		goto _timeout_;
+	}
+
+	rt1320_set_advancemode(rt1320);
+
+_timeout_:
+	regmap_write(rt1320->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
+	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
+
+	return ret;
+}
+
+static int rt1320_r0_load_mode_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1320->r0_l_reg;
+	ucontrol->value.integer.value[1] = rt1320->r0_r_reg;
+
+	return 0;
+}
+
+static int rt1320_r0_load_mode_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
+	int ret;
+
+	if (!rt1320->hw_init)
+		return 0;
+
+	if (ucontrol->value.integer.value[0] == 0 ||
+		ucontrol->value.integer.value[1] == 0)
+		return -EINVAL;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	snd_soc_dapm_mutex_lock(dapm);
+	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		rt1320->r0_l_reg = ucontrol->value.integer.value[0];
+		rt1320->r0_r_reg = ucontrol->value.integer.value[1];
+		rt1320_calc_r0(rt1320);
+		rt1320_r0_load(rt1320);
+	}
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 0;
+}
+
+static int rt1320_t0_r0_load_info(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.max = kcontrol->private_value;
+
+	return 0;
+}
+
+#define RT1320_T0_R0_LOAD(xname, xmax, xhandler_get, xhandler_put) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = rt1320_t0_r0_load_info, \
+	.get = xhandler_get, \
+	.put = xhandler_put, \
+	.private_value = xmax, \
+}
+
+static int rt1320_dspfw_load_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1320->fw_load_done;
+	return 0;
+}
+
+static int rt1320_dspfw_load_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (!rt1320->hw_init)
+		return 0;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
+		ucontrol->value.integer.value[0])
+		rt1320_dspfw_load_code(rt1320);
+
+	if (!ucontrol->value.integer.value[0])
+		rt1320->fw_load_done = false;
+
+	return 0;
+}
+
+static int rt1320_r0_temperature_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1320->temp_l_calib;
+	ucontrol->value.integer.value[1] = rt1320->temp_r_calib;
+	return 0;
+}
+
+static int rt1320_r0_temperature_put(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(rt1320->component);
+	int ret;
+
+	if (!rt1320->hw_init)
+		return 0;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	snd_soc_dapm_mutex_lock(dapm);
+	if ((snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) &&
+		ucontrol->value.integer.value[0] && ucontrol->value.integer.value[1])
+		rt1320_t0_load(rt1320, ucontrol->value.integer.value[0], ucontrol->value.integer.value[1]);
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 0;
+}
+
 static const struct snd_kcontrol_new rt1320_snd_controls[] = {
 	SOC_DOUBLE_R_EXT_TLV("FU21 Playback Volume",
 		SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_FU21, RT1320_SDCA_CTL_FU_VOLUME, CH_01),
@@ -1369,6 +2366,15 @@ static const struct snd_kcontrol_new rt1320_snd_controls[] = {
 	RT_SDCA_EXT_TLV("FU Capture Volume",
 		SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_FU113, RT1320_SDCA_CTL_FU_VOLUME, CH_01),
 		rt1320_set_gain_get, rt1320_set_gain_put, 4, 0x3f, in_vol_tlv, rt1320_dmic_fu_info),
+
+	SOC_SINGLE_EXT("R0 Calibration", SND_SOC_NOPM, 0, 1, 0,
+		rt1320_r0_cali_get, rt1320_r0_cali_put),
+	SOC_SINGLE_EXT("DSP FW Update", SND_SOC_NOPM, 0, 1, 0,
+		rt1320_dspfw_load_get, rt1320_dspfw_load_put),
+	RT1320_T0_R0_LOAD("R0 Load Mode", 0xffffffff,
+		rt1320_r0_load_mode_get, rt1320_r0_load_mode_put),
+	RT1320_T0_R0_LOAD("R0 Temperature", 0xff,
+		rt1320_r0_temperature_get, rt1320_r0_temperature_put),
 };
 
 static const struct snd_kcontrol_new rt1320_spk_l_dac =
@@ -1604,6 +2610,18 @@ static int rt1320_sdw_component_probe(struct snd_soc_component *component)
 	if (ret < 0 && ret != -EACCES)
 		return ret;
 
+	/* Apply temperature and calibration data from device property */
+	if ((rt1320->temp_l_calib <= 0xff) && (rt1320->temp_l_calib > 0) &&
+		(rt1320->temp_r_calib <= 0xff) && (rt1320->temp_r_calib > 0))
+		rt1320_t0_load(rt1320, rt1320->temp_l_calib, rt1320->temp_r_calib);
+
+	if (rt1320->r0_l_calib && rt1320->r0_r_calib) {
+		rt1320->r0_l_reg = rt1320->r0_l_calib;
+		rt1320->r0_r_reg = rt1320->r0_r_calib;
+		rt1320_calc_r0(rt1320);
+		rt1320_r0_load(rt1320);
+	}
+
 	return 0;
 }
 
@@ -1665,6 +2683,26 @@ static struct snd_soc_dai_driver rt1320_sdw_dai[] = {
 	},
 };
 
+static int rt1320_parse_dp(struct rt1320_sdw_priv *rt1320, struct device *dev)
+{
+	device_property_read_u32(dev, "realtek,temperature_l_calib",
+				 &rt1320->temp_l_calib);
+	device_property_read_u32(dev, "realtek,temperature_r_calib",
+				 &rt1320->temp_r_calib);
+	device_property_read_u32(dev, "realtek,r0_l_calib",
+				 &rt1320->r0_l_calib);
+	device_property_read_u32(dev, "realtek,r0_r_calib",
+				 &rt1320->r0_r_calib);
+	device_property_read_string(dev, "realtek,dspfw-name",
+				    &rt1320->dspfw_name);
+
+	dev_dbg(dev, "%s: temp_l_calib: %d temp_r_calib: %d r0_l_calib: %d, r0_r_calib: %d",
+		__func__, rt1320->temp_l_calib, rt1320->temp_r_calib, rt1320->r0_l_calib, rt1320->r0_r_calib);
+	dev_dbg(dev, "%s: dspfw_name: %s", __func__, rt1320->dspfw_name);
+
+	return 0;
+}
+
 static int rt1320_sdw_init(struct device *dev, struct regmap *regmap,
 				struct regmap *mbq_regmap, struct sdw_slave *slave)
 {
@@ -1683,6 +2721,8 @@ static int rt1320_sdw_init(struct device *dev, struct regmap *regmap,
 	regcache_cache_only(rt1320->regmap, true);
 	regcache_cache_only(rt1320->mbq_regmap, true);
 
+	rt1320_parse_dp(rt1320, dev);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1694,6 +2734,8 @@ static int rt1320_sdw_init(struct device *dev, struct regmap *regmap,
 	rt1320->fu_mixer_mute[0] = rt1320->fu_mixer_mute[1] =
 		rt1320->fu_mixer_mute[2] = rt1320->fu_mixer_mute[3] = true;
 
+	INIT_WORK(&rt1320->load_dspfw_work, rt1320_load_dspfw_work);
+
 	ret =  devm_snd_soc_register_component(dev,
 				&soc_component_sdw_rt1320,
 				rt1320_sdw_dai,
@@ -1740,6 +2782,9 @@ static int rt1320_sdw_probe(struct sdw_slave *slave,
 
 static int rt1320_sdw_remove(struct sdw_slave *slave)
 {
+	struct  rt1320_sdw_priv *rt1320 = dev_get_drvdata(&slave->dev);
+
+	cancel_work_sync(&rt1320->load_dspfw_work);
 	pm_runtime_disable(&slave->dev);
 
 	return 0;
diff --git a/sound/soc/codecs/rt1320-sdw.h b/sound/soc/codecs/rt1320-sdw.h
index a6d90e259dc9..5a9f496dd848 100644
--- a/sound/soc/codecs/rt1320-sdw.h
+++ b/sound/soc/codecs/rt1320-sdw.h
@@ -13,6 +13,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <sound/soc.h>
+#include "../../../drivers/soundwire/bus.h"
 
 #define RT1320_DEV_ID 0x6981
 #define RT1321_DEV_ID 0x7045
@@ -22,6 +23,8 @@
 #define RT1320_DEV_ID_1 0xc405
 #define RT1320_DEV_ID_0 0xc406
 
+#define RT1320_POWER_STATE 0xc560
+
 #define RT1321_PATCH_MAIN_VER 0x1000cffe
 #define RT1321_PATCH_BETA_VER 0x1000cfff
 
@@ -96,6 +99,57 @@ enum rt1320_version_id {
 #define RT1320_VC_MCU_PATCH "realtek/rt1320/rt1320-patch-code-vc.bin"
 #define RT1321_VA_MCU_PATCH "realtek/rt1320/rt1321-patch-code-va.bin"
 
+#define RT1320_FW_PARAM_ADDR 0x3fc2ab80
+#define RT1320_CMD_ID 0x3fc2ab81
+#define RT1320_CMD_PARAM_ADDR 0x3fc2ab90
+#define RT1320_DSPFW_STATUS_ADDR 0x3fc2bfc4
+
+#define RT1321_FW_PARAM_ADDR 0x3fc2d300
+#define RT1321_CMD_ID 0x3fc2d301
+#define RT1321_CMD_PARAM_ADDR 0x3fc2d310
+#define RT1321_DSPFW_STATUS_ADDR 0x3fc2dfc4
+
+/* FW parameter id 6, 7 */
+struct rt1320_datafixpoint {
+	int silencedetect;
+	int r0;
+	int meanr0;
+	int advancegain;
+	int ts;
+	int re;
+	int t;
+	int invrs;
+};
+
+struct rt1320_paramcmd {
+	unsigned char moudleid;
+	unsigned char commandtype;
+	unsigned short reserved1;
+	unsigned int commandlength;
+	long long reserved2;
+	unsigned int paramid;
+	unsigned int paramlength;
+};
+
+enum rt1320_fw_cmdid {
+	RT1320_FW_READY,
+	RT1320_SET_PARAM,
+	RT1320_GET_PARAM,
+	RT1320_GET_POOLSIZE,
+};
+
+enum rt1320_power_state {
+	RT1320_NORMAL_STATE = 0x18,
+	RT1320_K_R0_STATE = 0x1b,
+};
+
+enum rt1320_rw_type {
+	RT1320_BRA_WRITE = 0,
+	RT1320_BRA_READ = 1,
+	RT1320_PARAM_WRITE = 2,
+	RT1320_PARAM_READ = 3,
+};
+
 struct rt1320_sdw_priv {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
@@ -108,6 +162,18 @@ struct rt1320_sdw_priv {
 	unsigned int dev_id;
 	bool fu_dapm_mute;
 	bool fu_mixer_mute[4];
+	unsigned long long r0_l_reg;
+	unsigned long long r0_r_reg;
+	unsigned int r0_l_calib;
+	unsigned int r0_r_calib;
+	unsigned int temp_l_calib;
+	unsigned int temp_r_calib;
+	const char *dspfw_name;
+	bool cali_done;
+	bool fw_load_done;
+	bool rae_update_done;
+	struct work_struct load_dspfw_work;
+	struct sdw_bpt_msg bra_msg;
 };
 
 #endif /* __RT1320_SDW_H__ */
-- 
2.52.0

