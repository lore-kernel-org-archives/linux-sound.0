Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278923314B9
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423535; cv=none; b=eg8ku7afeAF3iJfCw+rSDaw+kpn0GRCumA7hXhk9hWDIM4216aulEIFAl1BeAJY93l2OTVbwG7RSOBBd+oB9XJaLAFhnXV/WBMoozGVBXXNAKmsj+/7wC0YM6OQW4r6dtecjd6OixQJ62EAfve1sYXb1N2x52MbLLJPmK8kE9Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423535; c=relaxed/simple;
	bh=mZe19bFK/S4/K+saPikdJBeJIpbKrPgWGTChE+D5OPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGEU1i8z5z+qaafwLz8wUMP8nSzOorPiJq+KlJdowGpl3UqcKEhyA+8YnGxLCFH6rWYosEIV5VFCVwFUJS3xLwejj98R0+BtY0XuCfxpDXmCCuBkDJ170MmKnuZ/PlZ9VyvkPSfRsB6UfeeDlGmaCE8ugm8xok0RYXsOrTtX3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MjQRkvpG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MjQRkvpG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso45853555e9.2
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 02:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423531; x=1770028331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77QZXmKdSVMSMO6XhwWHW9cRB7VDPOEmlJRMnWPda5M=;
        b=MjQRkvpGUheDT9YszmXnNK5TstIhbsMPaCX3WkJhTvkosKI9gdLXrmfia8TrjcfWHp
         mXIx2r2c7pfZQq2K3rE88WuDLglWzUJYl4b8S0edSADrD4OBHb5CnrlzVrcGHD5NVxcn
         c3ls7BDKXB4zvQALJgbxGlAOsFnRTuwYTsR4mEfW1CgP/LoWfWu8Z+iAUYjT+76D6Clz
         CZ8GQ1iTXfqdVjBCdb/0rcNCjhSq3EuslFsJLbIWKtB1JzL/pRdJRKOINhfHX0E69hEO
         YWtXcGS7zEsuJwhmgw/3jfDr1EcNo6StTOk9DwT6NN2mhJsADtoxqRj07pRBIMt2Xsq5
         6nLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423531; x=1770028331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=77QZXmKdSVMSMO6XhwWHW9cRB7VDPOEmlJRMnWPda5M=;
        b=mlyMMBrbZ36Ps0WbaVfrl/txTsUnAehphidM3ox+cH+5SybhNjRGCPvrtWCl9gSCbT
         5Q9AwNdhylwRh+7t4wcQFAfwcusOFfX+oQ4jPmvZNjLKC4k+IfURbqQ2ecTfNKvAmqJU
         6y7KWYq1Q968o70Y59FbBvIrXNjUJBlOMJ2JmXWEsU5vH59ubDACubdCeDn/SCqyYR/u
         2LNeCU7FmYA77aeVATk2DaR7Uxmys/14dVNdjMc8Xu70WLDQFoXiYIqJtYbmEK/9W5ih
         AThdgjpwJkvIqTu+kVdmAj1qGw48qNYTltqOskjKraDeclGSVrtrKr8Dtc2NgaUccf5a
         dPJw==
X-Forwarded-Encrypted: i=1; AJvYcCWTYwOqxYbk/sdzYuR8AUp/sW7QjJygcpUOxdMeMj8qKISIQhLBq7fAY8uCSBGgp7U2fmzWmtbcR1jWSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSHuJewuXE705Xd2sVFOu2m4oWEL1XUFIn+oghM0Y8lfX/uKC
	MapbRh163AIIOTQYiEPVkUvzQ1L5PdSMWmyxQC5hRKraAMU5MBY0iai+sDxN3XRWg4pam9ytU2A
	VYU93
X-Gm-Gg: AZuq6aKB8lkZPRhzldqSQj0F3hOdy5n4s7eWIdfzkl8SIJwYi3+U5paTsApjjRw85Aj
	6qVgtsDmSoFoCz6V54WpuPvccVDWl1GWUhRn8NmI7p2YE7xJSv0dh6ZOLADJKC+CmIbmSAbK5TS
	ovkGJtSRhrvYHUfAwWIoa/bfx0lIBqv3DW3+WCzTs0AU3PPSPa+gQV+2F4B9JTiBsJUywOLNidt
	C72xN7ieuqlsd1IJDDQGzmbviFAWZg7LJdcTEIoG8XLLf6H7uhKtNzRJvDtA7X0tHrYr4/1gM69
	ozxK93ghdRl6IQjN4neLUs57H9YLNpgFnbdFK/IwsBL/iKDc5ZWBYjjY+V/lNsaxUi0oNxrncX0
	mCKiKAiet8N5dEEk9IevDeu17E9VG1R+Vy+K7R7huEj/TrgpWRwpznRI/y8VzBjK4qefo19Jg43
	rbl264ReL3AN8+bKId/hWZJjxlT6TlpMjlZ7uThNQ=
X-Received: by 2002:a05:600c:4f8a:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-4805ce4e7e2mr71803555e9.16.1769423530663;
        Mon, 26 Jan 2026 02:32:10 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:32:09 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/7] dmaengine: sh: rz-dmac: Add suspend to RAM support
Date: Mon, 26 Jan 2026 12:31:53 +0200
Message-ID: <20260126103155.2644586-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC supports a power saving mode in which power to most
SoC components is turned off, including the DMA IP. Add suspend to RAM
support to save and restore the DMA IP registers.

Cyclic DMA channels require special handling. Since they can be paused and
resumed during system suspend and resume, the driver restores additional
registers for these channels during the resume phase. If a channel was not
explicitly paused during suspend, the driver ensures that it is paused and
resumed as part of the system suspend/resume flow. This might be the
case of a serial device being used with no_console_suspend.

For non-cyclic channels, the dev_pm_ops::prepare callback waits for all
ongoing transfers to complete before allowing suspend-to-RAM to proceed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/dma/sh/rz-dmac.c | 183 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 175 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index ab5f49a0b9f2..8f3e2719e639 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -69,11 +69,15 @@ struct rz_dmac_desc {
  * enum rz_dmac_chan_status: RZ DMAC channel status
  * @RZ_DMAC_CHAN_STATUS_ENABLED: Channel is enabled
  * @RZ_DMAC_CHAN_STATUS_PAUSED: Channel is paused though DMA engine callbacks
+ * @RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL: Channel is paused through driver internal logic
+ * @RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED: Channel was prepared for system suspend
  * @RZ_DMAC_CHAN_STATUS_CYCLIC: Channel is cyclic
  */
 enum rz_dmac_chan_status {
 	RZ_DMAC_CHAN_STATUS_ENABLED,
 	RZ_DMAC_CHAN_STATUS_PAUSED,
+	RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL,
+	RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED,
 	RZ_DMAC_CHAN_STATUS_CYCLIC,
 };
 
@@ -94,6 +98,10 @@ struct rz_dmac_chan {
 	u32 chctrl;
 	int mid_rid;
 
+	struct {
+		u32 nxla;
+	} pm_state;
+
 	struct list_head ld_free;
 	struct list_head ld_queue;
 	struct list_head ld_active;
@@ -1002,10 +1010,17 @@ static int rz_dmac_device_pause(struct dma_chan *chan)
 	return rz_dmac_device_pause_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED);
 }
 
+static int rz_dmac_device_pause_internal(struct rz_dmac_chan *channel)
+{
+	lockdep_assert_held(&channel->vc.lock);
+
+	return rz_dmac_device_pause_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL);
+}
+
 static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
 				     enum rz_dmac_chan_status status)
 {
-	u32 val;
+	u32 val, chctrl;
 	int ret;
 
 	lockdep_assert_held(&channel->vc.lock);
@@ -1013,14 +1028,33 @@ static int rz_dmac_device_resume_set(struct rz_dmac_chan *channel,
 	if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED)))
 		return 0;
 
-	rz_dmac_ch_writel(channel, CHCTRL_CLRSUS, CHCTRL, 1);
-	ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
-				       !(val & CHSTAT_SUS), 1, 1024, false,
-				       channel, CHSTAT, 1);
-	if (ret)
-		return ret;
+	if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED)) {
+		/*
+		 * We can be after a sleep state with power loss. If power was
+		 * lost, the CHSTAT_SUS bit is zero. In this case, we need to
+		 * enable the channel directly. Otherwise, just set the CLRSUS
+		 * bit.
+		 */
+		val = rz_dmac_ch_readl(channel, CHSTAT, 1);
+		if (val & CHSTAT_SUS)
+			chctrl = CHCTRL_CLRSUS;
+		else
+			chctrl = CHCTRL_SETEN;
+	} else {
+		chctrl = CHCTRL_CLRSUS;
+	}
+
+	rz_dmac_ch_writel(channel, chctrl, CHCTRL, 1);
 
-	channel->status &= ~BIT(status);
+	if (chctrl & CHCTRL_CLRSUS) {
+		ret = read_poll_timeout_atomic(rz_dmac_ch_readl, val,
+					       !(val & CHSTAT_SUS), 1, 1024, false,
+					       channel, CHSTAT, 1);
+		if (ret)
+			return ret;
+	}
+
+	channel->status &= ~(BIT(status) | BIT(RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED));
 
 	return 0;
 }
@@ -1034,6 +1068,13 @@ static int rz_dmac_device_resume(struct dma_chan *chan)
 	return rz_dmac_device_resume_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED);
 }
 
+static int rz_dmac_device_resume_internal(struct rz_dmac_chan *channel)
+{
+	lockdep_assert_held(&channel->vc.lock);
+
+	return rz_dmac_device_resume_set(channel, RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL);
+}
+
 /*
  * -----------------------------------------------------------------------------
  * IRQ handling
@@ -1438,6 +1479,131 @@ static void rz_dmac_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static int rz_dmac_suspend_prepare(struct device *dev)
+{
+	struct rz_dmac *dmac = dev_get_drvdata(dev);
+
+	for (unsigned int i = 0; i < dmac->n_channels; i++) {
+		struct rz_dmac_chan *channel = &dmac->channels[i];
+
+		guard(spinlock_irqsave)(&channel->vc.lock);
+
+		/* Wait for transfer completion, except in cyclic case. */
+		if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_ENABLED) &&
+		    !(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
+			return -EAGAIN;
+	}
+
+	return 0;
+}
+
+static void rz_dmac_suspend_recover(struct rz_dmac *dmac)
+{
+	for (unsigned int i = 0; i < dmac->n_channels; i++) {
+		struct rz_dmac_chan *channel = &dmac->channels[i];
+
+		guard(spinlock_irqsave)(&channel->vc.lock);
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
+			continue;
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL)))
+			continue;
+
+		rz_dmac_device_resume_internal(channel);
+	}
+}
+
+static int rz_dmac_suspend(struct device *dev)
+{
+	struct rz_dmac *dmac = dev_get_drvdata(dev);
+	int ret;
+
+	for (unsigned int i = 0; i < dmac->n_channels; i++) {
+		struct rz_dmac_chan *channel = &dmac->channels[i];
+
+		guard(spinlock_irqsave)(&channel->vc.lock);
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
+			continue;
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED))) {
+			ret = rz_dmac_device_pause_internal(channel);
+			if (ret) {
+				dev_err(dev, "Failed to suspend channel %s\n",
+					dma_chan_name(&channel->vc.chan));
+				continue;
+			}
+		}
+
+		channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
+		channel->status |= BIT(RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED);
+	}
+
+	pm_runtime_put_sync(dmac->dev);
+
+	ret = reset_control_assert(dmac->rstc);
+	if (ret) {
+		pm_runtime_resume_and_get(dmac->dev);
+		rz_dmac_suspend_recover(dmac);
+	}
+
+	return ret;
+}
+
+static int rz_dmac_resume(struct device *dev)
+{
+	struct rz_dmac *dmac = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(dmac->rstc);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dmac->dev);
+	if (ret) {
+		reset_control_assert(dmac->rstc);
+		return ret;
+	}
+
+	rz_dmac_writel(dmac, DCTRL_DEFAULT, CHANNEL_0_7_COMMON_BASE + DCTRL);
+	rz_dmac_writel(dmac, DCTRL_DEFAULT, CHANNEL_8_15_COMMON_BASE + DCTRL);
+
+	for (unsigned int i = 0; i < dmac->n_channels; i++) {
+		struct rz_dmac_chan *channel = &dmac->channels[i];
+
+		guard(spinlock_irqsave)(&channel->vc.lock);
+
+		rz_dmac_set_dma_req_no(dmac, channel->index, channel->mid_rid);
+
+		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC))) {
+			rz_dmac_ch_writel(&dmac->channels[i], CHCTRL_DEFAULT, CHCTRL, 1);
+			continue;
+		}
+
+		rz_dmac_ch_writel(channel, channel->pm_state.nxla, NXLA, 1);
+		rz_dmac_ch_writel(channel, channel->chcfg, CHCFG, 1);
+		rz_dmac_ch_writel(channel, CHCTRL_SWRST, CHCTRL, 1);
+		rz_dmac_ch_writel(channel, channel->chctrl, CHCTRL, 1);
+
+		if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL)) {
+			ret = rz_dmac_device_resume_internal(channel);
+			if (ret) {
+				dev_err(dev, "Failed to resume channel %s\n",
+					dma_chan_name(&channel->vc.chan));
+				continue;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops rz_dmac_pm_ops = {
+	.prepare = rz_dmac_suspend_prepare,
+	SYSTEM_SLEEP_PM_OPS(rz_dmac_suspend, rz_dmac_resume)
+};
+
 static const struct rz_dmac_info rz_dmac_v2h_info = {
 	.icu_register_dma_req = rzv2h_icu_register_dma_req,
 	.default_dma_req_no = RZV2H_ICU_DMAC_REQ_NO_DEFAULT,
@@ -1464,6 +1630,7 @@ static struct platform_driver rz_dmac_driver = {
 	.driver		= {
 		.name	= "rz-dmac",
 		.of_match_table = of_rz_dmac_match,
+		.pm	= pm_sleep_ptr(&rz_dmac_pm_ops),
 	},
 	.probe		= rz_dmac_probe,
 	.remove		= rz_dmac_remove,
-- 
2.43.0

