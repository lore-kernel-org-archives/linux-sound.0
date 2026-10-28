Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153182;
	b=xGKJe/uZi/CKPewjCJUvg6ft/DdkFQPkk/GeAiJ+rCoOLbgKOP1PwdlDotHG1wxcVJBc
	 PcbUSI7CxMDxq3E1b9hTf1zeEA+WI4Z9Ddysz7CcAXDdCmWS036aXWVrSvybZSU1jZoQI
	 MVDUiSxo25XKhnhJFJhNPFLMo2Je4XiS0kv4claky46AwPwHSK1TxhgJdo9Z/ylTzPY4O
	 OedOXkGjgr8yLcmNPlskOLuGpD7NWoB97ZbkMN0Xk5gu97GB7U1rImWqWP+UroF+L6w/+
	 iS2oR1G0vcDHbSqMY96THHc2o9uPQ/8ELRCLoVZp9pi5xGHmnQE/uJReDbW8IwVI6tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jG5bu+hNGVsYQKnI9LFFBzXtngCs30s/36O1R6l9Dy4=;
	b=gZ0j2VqUy25tOPCMHiYGlixT/wM+zbl4wbAJP/1pt3MyFqiLavXTYLP206/QLvaXBrox
	 VvK0avEGsuR4burtlYmFaLExdwLiZlhVgjZzb+aWC8Tu2T5w2JuGk5llsGeDl/Yne2tov
	 +pDAmfgbSaX0uY8jHUYvGW8QIIbHyQ9G8bEac/VNqQ65C6zOrbBEFbA3RcgRcyZA0L68F
	 8imIzJIcpIHI/+0rQXbezbAAlcOPKmqgPlNSsx69Tp8s6OaOE7zvp99lQqtuAhwX2IDPD
	 SsjXP+t5M0BWY3f1/chyzMKJV0ud/gEIp4eQOZ5siOyTbmrKSLApUR3ZF2vqnOibpPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKbEvoor;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB610606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB610606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKbEvoor
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8451a619da7so368968a34.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153180; x=1793757980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jG5bu+hNGVsYQKnI9LFFBzXtngCs30s/36O1R6l9Dy4=;
        b=kKbEvoor7Vi2xbuAWVe1Dig7TyavDYCgmEQZtqlQMNPYZ+NqeDkvWp9SZrMay8XR5g
         URBL2Q75itpK2lu8PzIRcZL5ajctVSAtzETa2yyRNbziS3eRGnATLTzLhDviVesUbdLn
         nqb04xXA1GUH5eB3i/DErlbor1H/dsb0rAR6no7vCcvVjgUg6EZ9A9wRmAoHynuVwlDk
         4uiNRu65AxTk2wE32f5qMqmDPcLE/PnCKfPkmSo0rd/Jf23TQziHq/ZSzVUq3/HIwquX
         QSKNYdkggAeGm4kuCeL3CSqxnnz2evKVv62zyOF14LwfeJLQjLnerrbPoUDeHf17RC/e
         MjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153180; x=1793757980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jG5bu+hNGVsYQKnI9LFFBzXtngCs30s/36O1R6l9Dy4=;
        b=WSUPfUFP4V8zF3Wj9mCUd9SkCXGfgqGCAQyRdo5Dq8eFpFdFIC9/zigtnqeYYO6jRe
         24CAzIcBBXOcvYHIiw3i6SFO2pSecZQuI89gj+bgbq26RG/5K3I1T5sHFOO8FjuNXPs7
         Hzs7Oomej9mzWbHthmZONHcUZiJtWI1WxwFXrI4fEa1RybKQYiB5ZrcO8v3fVx60NPgW
         0YhyqJymAYk0DTqVMFPDprvAdOnkAi77roSO0cIvwmvXbNTpAvABW6BcrTKQKpPiXr5K
         4RrWWxqcW9t5Ki6+5u2Krq4qn1nuWGK63VQRZaKgIKYBhaBDvoiriGJwlzsmy9w0ZL7P
         i21Q==
X-Gm-Message-State: AFq9FYLdQ7Chn0xDdrJAVua9UpSqZ43D8Z1Bnfp9NTkE2BaX7wJ2XAEk
	0FJt/phyqGU4u4ZkRAxqKciZciRGxUP3zQT8EeIPwbeTRAdsBGt855wF
X-Gm-Gg: AYBFou0eqnjnRnTWs4oVnhwEYaNR2Aj/NDZ2FIV268Zzwjr6rVLe6xOMshTR6V9s8ak
	H8mNMPC+t36PjlPg6qYykNSjFx2wuJYJkDvgIUZCuZsiLYPH5XK2FrHlNCGmJS0FQ0OmwE7wSYE
	MjgWy3VTcPT0lkBdbPJlrzfPSeFfEcZGBK8mLeiSjQNpIjUK3XBw0PXzXOMu9CVYofiZGH0Db/i
	E4t8nKIKQdYHG74qYSUjXM/fwZTZ7YGskx5KiAv9V8MohT7kZDivuX8OTf0g3M3uVhpMHgsyqsL
	y0wQTKXQbVgA5BUYA/2jjVaa6uqEDr0uyjF/ViizWtX4hEiNO0JSDLCD0dOyeFZa/qFdQywnFYq
	cFdAnebUlsK0E1nb/MHl/fcPcbXhI20+L8gG1sw5x4q9+16KE1gM4rR+ufAMTDQ4uopsiUB7EKv
	5h5KBeirekgamFTMG+HvhkclEvNgDsFKboaI4Wr+di5+/XcBTdwAD4bWa3vXpXM8UB5uPYb47jW
	a/HS5lF1XbcKQ+vBpToWJCxLD8qTzBqP9uh/8/bj44LR9WUrRyJKQLRzlfRkctFgDPLF58gMSuB
	91hrrLJyevxwYSiYVKq3FaZLceKX0GbTwERN49CcNWt4uTNf9p6jjwVd+kzQESICTg5P5IUhk/n
	f+pxelJeN8YjyTIlrjnaZ41D4RZCMpatPT7RmmXfOdIA=
X-Received: by 2002:a05:6830:4ac6:b0:815:cdb4:4a7 with SMTP id 46e09a7af769-85ab6782f09mr1196992a34.3.1793153180630;
        Tue, 27 Oct 2026 19:06:20 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:19 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 2/11] soundwire: amd: support ACP6x SoundWire managers
Date: Tue, 27 Oct 2026 22:05:43 -0400
Message-ID: <20261028020552.35278-3-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rembrandt (ACP6x) uses the same SoundWire manager layout as ACP6.3:
the SDW0/SDW1 data-port register maps and the TX/RX port counts are
identical.  Accept the ACP6x PCI revisions and reuse the ACP6.3
register maps and port counts.

This assumes the ACP6x SoundWire block is register compatible with
ACP6.3 and needs to be validated on hardware.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 drivers/soundwire/amd_manager.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a3316ef..697ec93 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -559,6 +559,8 @@ static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_pa
 
 	dev_dbg(amd_manager->dev, "p_params->num:0x%x\n", p_params->num);
 	switch (amd_manager->acp_rev) {
+	case ACP6X_PCI_REV_ID:
+	case ACP6XR_PCI_REV_ID:
 	case ACP63_PCI_REV_ID:
 		switch (amd_manager->instance) {
 		case ACP_SDW0:
@@ -602,6 +604,8 @@ static int amd_sdw_transport_params(struct sdw_bus *bus,
 	u32 offset_reg, lane_ctrl_ch_en_reg;
 
 	switch (amd_manager->acp_rev) {
+	case ACP6X_PCI_REV_ID:
+	case ACP6XR_PCI_REV_ID:
 	case ACP63_PCI_REV_ID:
 		switch (amd_manager->instance) {
 		case ACP_SDW0:
@@ -674,6 +678,8 @@ static int amd_sdw_port_enable(struct sdw_bus *bus,
 	u32 lane_ctrl_ch_en_reg;
 
 	switch (amd_manager->acp_rev) {
+	case ACP6X_PCI_REV_ID:
+	case ACP6XR_PCI_REV_ID:
 	case ACP63_PCI_REV_ID:
 		switch (amd_manager->instance) {
 		case ACP_SDW0:
@@ -1100,6 +1106,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	amd_manager->bus.controller_id = 0;
 	dev_dbg(dev, "acp_rev:0x%x\n", amd_manager->acp_rev);
 	switch (amd_manager->acp_rev) {
+	case ACP6X_PCI_REV_ID:
+	case ACP6XR_PCI_REV_ID:
 	case ACP63_PCI_REV_ID:
 		switch (amd_manager->instance) {
 		case ACP_SDW0:
