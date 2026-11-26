Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795680396;
	b=B5YCRZqRry2gu5qv23fMbUkrhZb08yj1HOJGFTYzuzjiTtUc2TUT6bhhECdWSrAFiVSy
	 0JslqhRfdd67XRcKmHBXBgWXGiH5Se0SPwex2iQWPcKs72Wd8UCme0KPjuzTEUndeNgEC
	 DMuM+BxnOpi2lLegp8ciKTo0+T67DUzrQ2UQgvS5sHCIfcATO9He7VZNKwb16UaPULCSt
	 fIzUL39jp3eLG5xrzEQoU0DIGWjc94SSiRfEJDXWY+JP4100bMRRxxnXQqxxUijFOdkoO
	 eIHGmTgam21e8fBkuhS3JdfJJm855vrYZ7dLlsBGEzLOBB+r6TMD+A+kbfnFfkSwenQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680396;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=olAxKbB62OgQce3he+BE266BHrDhBKP4TZppMIDZn+E=;
	b=ELwlON4QHRcHExEefnNpfO0mHjUbfMn9Uvf5JCApn63AEf3TYgJOzslk09PIzVd6pBy5
	 VU1OyvvGcOLz+Sl7fYa8G+Ef0xltS9qnR7b3RlWphRMxj8wP0GUIVXifSUu8kPD/aEasE
	 fnpcnBGPHG1EN1sPHUwDhv9vFSPceI4wpZ1L+bxMCTgrXgYxgaQqZp3OYZD/E5z+h5t1X
	 JzutANYt9+30iOLyHJiJOKFzsBKDasPoZO8N5lW75GdZi08gvCYOaVfENoB/wMOOwzuBO
	 bV/Qz9MLJ+XrBx+i7rbOo656r01DPx0Qu50FGQQfmK9lfGfneqFlTYVci3WxuM0ipxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJo76TTB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006F606A326;
	Thu, 26 Nov 2026 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJo76TTB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795680395;
	b=OK7/eu1ZtxxgwYSjshwpyaC7H3VFo6+6Cula1qTzHrrJebRm+lcVOq4FTY2rfebWPK3S
	 uOcQSVbExGjm/ijMDVFN7gg/D9Y5RmRPSRxtLalTwVjYrhasg9OfJDiGay7vhQoLataF9
	 ZJd61FC0qVatcLhFCWEdgG3Hna3Ojq7O/QZbm36URMFkArN/PEJcMq9XA5nq6rUVydAS6
	 TK44e2AUf0/4yfmdz/9LIr+wb4YyOmBlhJIiaBW89mqEhCuZec+hPq09hj+VOe7PtsP4m
	 NN6AaCgS/eeLKWAtsiomXR1hM2u/q5pWY5cVUGxH1lZ7M2N5YULS/+xvybERV1dORrg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795680395;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=olAxKbB62OgQce3he+BE266BHrDhBKP4TZppMIDZn+E=;
	b=c1DxWpLQHiy/bT68g5gxqDTWI+tFjIt9w6T6j3MSBuc5fsN5Su727ZdnOySM8T5x+OH/
	 54bl5KPepz9ghfWdZwhi+WF5vcTrkawj+0o0x8xI6SGEogWztvPYrOvbfNka+9mYgnKtE
	 jhsBjJhqLofyu1NK3DFkKF3V2ogVbgov9NY7ZjlUXgK2Oxmb9bWVatTAYp8O2dJuJhh3J
	 JZn/eulrBAGuBUUWCTHVOmFc9gZVv3jeBdG8s+bX5komnA3WtAgt9kR0+/y6MR4cdH9GR
	 4e1H4CnINg+uWVp96BiHZOGjLWuUQIOYFlD7QLPBmujzYHHt2kk9yM1G9basusnWzrg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 414A61F000D0;
	Thu, 26 Nov 2026 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795680395;
	bh=olAxKbB62OgQce3he+BE266BHrDhBKP4TZppMIDZn+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eJo76TTB9gc8GC8UV+zVr4zpu9VvfaQ2P9kXGsLctmJmoA/pJ2i/CyKEmpM/sJVru
	 oTPHvWNSqcdbLzXCb0ysx2Sv76RSZ1xi6WM+FYN/lzZncSr2LY95Q8F/GLVOcIM15D
	 8tMd1zWG8FgqO+Vufzf90L+MZn/jwpy82PAd6Lu4zf6A6P5AYkelDmXROv7LThuquD
	 rDKwLWIu6eN7MXuZzV73BCn8c9xuuA6HIK19FdKanEozwv6q1TrL3uzQGaLapW41py
	 5FzQhgeVFYropenR40/gdHTqklB23J2gwZv84KNxb3+UrlgjU0nXYTvbWox712wJtA
	 jIH7CxEdAYMWw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B987E4D2D1;
	Thu, 26 Nov 2026 08:06:24 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:06:24 +0100
Subject: [PATCH v2 1/2] soundwire: qcom: serialize WCD AHB bridge
 transactions
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
Message-Id: <20261126-qcom-soundwire-fixes-v2-1-07075d571c6c@gmail.com>
References: <20261126-qcom-soundwire-fixes-v2-0-07075d571c6c@gmail.com>
In-Reply-To: <20261126-qcom-soundwire-fixes-v2-0-07075d571c6c@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795680384; l=3091;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=5uJq685h5aRJoQkGPj7uFNL/b8j1PB/pVjJOUzHUz2E=;
 b=GNdhuHp0Mre8YZRbkNI5DEED5T+BAMcB0/gaM+OCxchZbGAs1O5Pi0vgvdkwkVHS8nXxkP5GJ
 Rhyvzds58RzCVGqg7ayNllfbLDT2FyrLEtZN6EaMauIxfmM5LQgOwez
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

On SLIMbus-hosted WCD934x Qualcomm SoundWire controllers, each AHB
bridge register access spans two separate regmap_bulk_*() transfers
(SWRM_AHB_BRIDGE_RD_ADDR_0 followed by SWRM_AHB_BRIDGE_RD_DATA_0, or
SWRM_AHB_BRIDGE_WR_DATA_0 followed by SWRM_AHB_BRIDGE_WR_ADDR_0).

Without controller-level serialization across each pair, concurrent
accesses from the threaded IRQ handler and bus/init callers can
interleave on the shared AHB bridge registers and corrupt reads or
writes.

Add ahb_lock to struct qcom_swrm_ctrl to serialize each two-step AHB
bridge register transaction.

Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/soundwire/qcom.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index c31d921f679f968652c744aceecf001ab3794a6c..368f511867835e6ce1e1d7f0827461413c25a96e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -202,6 +202,8 @@ struct qcom_swrm_ctrl {
 	struct completion enumeration;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
+	/* Serialize two-step WCD AHB bridge address/data accesses */
+	struct mutex ahb_lock;
 	struct clk *hclk;
 	int irq;
 	u32 ee;
@@ -388,18 +390,18 @@ static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
 	struct regmap *wcd_regmap = ctrl->regmap;
 	int ret;
 
+	mutex_lock(&ctrl->ahb_lock);
 	/* pg register + offset */
 	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_RD_ADDR_0,
-			  (u8 *)&reg, 4);
+				(u8 *)&reg, 4);
 	if (ret < 0)
-		return SDW_CMD_FAIL;
+		goto out;
 
 	ret = regmap_bulk_read(wcd_regmap, SWRM_AHB_BRIDGE_RD_DATA_0,
 			       val, 4);
-	if (ret < 0)
-		return SDW_CMD_FAIL;
-
-	return SDW_CMD_OK;
+out:
+	mutex_unlock(&ctrl->ahb_lock);
+	return ret < 0 ? SDW_CMD_FAIL : SDW_CMD_OK;
 }
 
 static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
@@ -407,19 +409,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
 {
 	struct regmap *wcd_regmap = ctrl->regmap;
 	int ret;
+
+	mutex_lock(&ctrl->ahb_lock);
 	/* pg register + offset */
 	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_DATA_0,
-			  (u8 *)&val, 4);
+				(u8 *)&val, 4);
 	if (ret)
-		return SDW_CMD_FAIL;
+		goto out;
 
 	/* write address register */
 	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_ADDR_0,
-			  (u8 *)&reg, 4);
-	if (ret)
-		return SDW_CMD_FAIL;
-
-	return SDW_CMD_OK;
+				(u8 *)&reg, 4);
+out:
+	mutex_unlock(&ctrl->ahb_lock);
+	return ret ? SDW_CMD_FAIL : SDW_CMD_OK;
 }
 
 static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
@@ -1680,6 +1683,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
+	mutex_init(&ctrl->ahb_lock);
 	init_completion(&ctrl->broadcast);
 	init_completion(&ctrl->enumeration);
 

-- 
2.47.3


