Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795680395;
	b=2m1/tYydsr4R4ZWkXk7qi0gNpDDnDrdU1lMgrZASxKv8tYFcoWYaq7pugKKz+OnxqGTF
	 FjJnUKFAI9K/ULRObI/7ZgWzB10rl+kFPwjA2dMtkA3UZUxRLxMytWqc/WPgRGhDexTtR
	 ZLX34L3lm/gii9amuwHYNecpPy3EAtdeI9JPrMoIMJgO9OzLCHqB8NtUf1LRVjAo+d2+a
	 CX7daOhrwMGgMS1OTXxbyv5MLTWe/Rc+giSwa5qYflpqURscCJ5apBdNAkWpBYtwIDX2/
	 8Jx68aw896C4a5d2upfJtH1u9rxePvxxYb/FgXpqfelf/LU1Tkq+PDBp18I3Mqkh7rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680395;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FQybvFX894b94zOe4XX7HE3ZCk/PfBxVFfJWsqOi/eo=;
	b=Y32VxX5oRqR+n43aX4IagD63C88Ryu9boGYIRPuWkwUP0o4XgDIaIeIusO4VCQDbW+Da
	 e8nfn1XQqplO3Yk2t9OtcZSH5XBR9JdYHipQPbDkzKT6e/nJ60yJBmUIpMtpGaPYLsJlS
	 veH1l1qRvA7kpBp87m8lmpe2DSjjb9rjEpBw7sZbqVZPO4QmvKtcgFBh8yPM7JJ35uStV
	 +EsAeSjfXu0ncYJyzyA9RqIDiKoZJO1csEDDDycIb7Kn/oFIC2nmbEwTidgRs5d+7xTCn
	 V1egY0nY6AP1M5Vc7dUbcqXx2nwA25mXzRoVKhrboVJAUKz9q3/lAf8lJe7GXQJWcXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wn+beGgw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C17606A31E;
	Thu, 26 Nov 2026 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wn+beGgw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795680395;
	b=fyGpzOSn1IJQN4lk7Bvg6UE0Qp3gZyfUJrG4T20SxFRI2XZas8enY5qpBIGHu23s4KsU
	 Yo20edpLDtyIHzO6/ayBKNPTlUokLZ6d5nRzVZm1ZF98N5tmVZTpnwwIDBT1qpSTq+4z1
	 /kFL8LuQvO3HX2yBrfr/JDfyth28SkxiTaqBhtiIpB6JDEXbitaqVyOTSDhdfejUn+/1/
	 iquh2hjRsiB06A5QbY6b7SYaJOv+Bn6WyTtR5hhu+79oAzW4YaRpy8kaTv49r3q8/ak/a
	 jpyW3Y7wFakboGEVGpWLuYgrVgDig2gJmpOZLnaa4M1YMrTmI3H4bMOzZ7VBtRXl13w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795680395;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FQybvFX894b94zOe4XX7HE3ZCk/PfBxVFfJWsqOi/eo=;
	b=w/sAPSaknOXUiReJHxsddsgCxQ/0n5UXwYFKaDvah8eNoHEIQ2pD5Mhxo7yIpwh/EoL8
	 OzZloS8mJ1L+w8kUCiWKmmL3NhLLZ2v8TjhPdMEDhErd4jvIcGkP/WAd+fsPAQEpJCDIS
	 VREhiOgnAYPTF3cSfpL5k01gPsFVOj+YzDC9eI55zJytogx6j+ARsBZiIVBzofdsbvLlS
	 pIJbUxwYHAXbDj/MVl4wG0VbIPe+N/xvM8ZchyIAxrq8Gbmd9RD51cVXqkciDKolK/Wyf
	 6NRKqFQyS785BO4H7yPdUj53d/9aScHZl4Q0yPT7MWxxghdybNjCWeiJkuIc2RC44oQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BD0E1F000D2;
	Thu, 26 Nov 2026 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795680395;
	bh=FQybvFX894b94zOe4XX7HE3ZCk/PfBxVFfJWsqOi/eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Wn+beGgwL03Tl9il41Y8BmvOQ3XlolXR5T5HsX0Arv4ZEiXqWbKRSMQxbR3KKnd9e
	 lXimX7We1xSOuNXIu19uixh08NFcSgrCk+Hazw+xEgDoN+OXHCZ16zlp3iTJdhqNuD
	 3yketvznrNvfI3h6m/rvLO2DXOGDFuaS0Gzgj2k2wY7mrzrq8uigV6h954be26OXw1
	 m4b1faitqA7D02cmUjpPU9QkzwdzXASp0JDLHImQ9veam5tHCu/JNDJEOU9FnqIU7y
	 5xhpUUXdnW1uCPgVcstSPVlwmgk81nV9uq82rTFWD4hadWyYx3xxZzblCaYDj8Vgbk
	 5QIYXk2E1XuBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D82CF4D2DD;
	Thu, 26 Nov 2026 08:06:24 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:06:25 +0100
Subject: [PATCH v2 2/2] soundwire: qcom: populate wr_fifo_depth before
 enabling interrupts
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-qcom-soundwire-fixes-v2-2-07075d571c6c@gmail.com>
References: <20261126-qcom-soundwire-fixes-v2-0-07075d571c6c@gmail.com>
In-Reply-To: <20261126-qcom-soundwire-fixes-v2-0-07075d571c6c@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795680384; l=2256;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=8Qso5IwRqEerqBP9NGVcWyoCtji3lApD3wWwG48EWT0=;
 b=o6uCshAhdgdbp+Y8q5Ylv/G3vIN8pA0bJYWxh6JmWKtGu9uBNmb83gzt2QXiryVVnm6QR45w9
 5lAtFVoYGnFAUOuCnl3yg2f2jeVSOF5tn5gT/VnPLHtuQ9Og6YuDHSo
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

ctrl->wr_fifo_depth is currently populated at the end of
qcom_swrm_init(), after devm_request_threaded_irq() in qcom_swrm_probe()
and after enabling CPU interrupts in qcom_swrm_init().

If a SoundWire interrupt fires before SWRM_COMP_PARAMS has been read,
qcom_swrm_cmd_fifo_wr_cmd() observes ctrl->wr_fifo_depth == 0 and fails
with -EIO ("err write overflow").

Read and validate SWRM_COMP_PARAMS in qcom_swrm_probe() prior to
requesting the threaded IRQ, and drop the redundant read from the end of
qcom_swrm_init().

Fixes: a661308c34de ("soundwire: qcom: wait for fifo space to be available before read/write")

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/soundwire/qcom.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 368f511867835e6ce1e1d7f0827461413c25a96e..d4568d948ca9f8f52b061608e9bd33b1fbaded44 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1008,12 +1008,6 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	swrm_wait_for_frame_gen_enabled(ctrl);
 	ctrl->slave_status = 0;
-	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
-
-	if (ctrl->version >= SWRM_VERSION_3_1_0)
-		ctrl->wr_fifo_depth = FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, val);
-	else
-		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
 
 	return 0;
 }
@@ -1717,6 +1711,21 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
 	qcom_swrm_set_ee_register_layout(ctrl, data);
 
+	ret = ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
+	if (ret != SDW_CMD_OK) {
+		ret = -EIO;
+		goto err_clk;
+	}
+	if (ctrl->version >= SWRM_VERSION_3_1_0)
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	else
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	if (!ctrl->wr_fifo_depth) {
+		dev_err(dev, "Invalid write FIFO depth in SWRM_COMP_PARAMS: %#x\n", val);
+		ret = -EINVAL;
+		goto err_clk;
+	}
+
 	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
 					qcom_swrm_irq_handler,
 					IRQF_TRIGGER_RISING |

-- 
2.47.3


