Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29938404BCD
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006649; cv=none; b=fUlHld3rXs20/2OL3VJGLh4kacjyKB3WcVayuYEQva49gvb0hiJNT4dcmukWvozp5RnTsTbE3C76OcrMShlLghVtHS9JBcZm6ElUNmjzbKbc27LUDPjCNgHP0vh6xcSHKbjE+Uq6VVrFa5BTBATSSL/VR8IzhUDP50EkPjZBjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006649; c=relaxed/simple;
	bh=jZVaJCpdJPCmA7RMD7l6HhgA0fLolhoJy+4MYoGPoWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OaPvWxTiNbHBTfEHd2E9MCZrIArwK46X2BhsY1ItKlygR3i4UhTXwgTQ2wfiExUDKv+Bf+N1LxaaUGUmbXwbX3C6imUXipqKH0yYE8+aaAfJyy7BN0QILbl6GdtIrckDDJJhwWYpgRBSglsIn5BuCEKj1nmApcSXy7fkhv1rOAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQL/6mGp; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQL/6mGp"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30749947917so3697440eec.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781006647; x=1781611447; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yamXPCwQjj/bccldgb8NO8/20UgmKojt3wb1DmnP/c0=;
        b=gQL/6mGp65hVwBfV60JNVycowV9NkFf8C8DdIkTw8qySjZmw7NmfoL5fR+7U1HcYQ6
         HdIUQ9klpTYgOASBojyfDs++937demYRCsZD/1Tf24hDD8mg71njWHLV6twYrxc0z//W
         6dSq3JUzX9xPPPSo1ntt4XwlRdJ/Kl/xPf6u0D8b8BDsQoeTWXlYK4IYakqftWl3CAb4
         CZZLb0iCIKOY10lXq8L3w9p6ob/4iJbT0g8hodY+UBMqpJSR0jPajxZMEp20mpdXreoB
         dhmGiGrVwMx1Wxv8EffncjkLK9kJ4geKJx/Wjko0hWOnKmHHbMJnjKGAzReNo5mn/6+L
         4xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006647; x=1781611447;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yamXPCwQjj/bccldgb8NO8/20UgmKojt3wb1DmnP/c0=;
        b=p7JjCvQ+KqIfvBL1Hd4rcTl2pp5gamPwTc72PUSgPjkr6GYgx3fOI3buTTnUvAiVM8
         teESegNX0O3s6ZNWC4bdWjMOellPcR3V5zEo+k58fpHKEc7eb50bOKs5zAS9EZitiOkS
         2WFzio/jgUUQGDoPNy4Cl3ZFcL5FmWA6xqUGpFh+laJfBf2l8MTkDy/ucykUQ5mKP6nc
         1ynD3Oo+hvcx70hOLmK3pE3mFcIGCGkhc6XtA5thH9zoES2BDfalL0tqxyPzHF4G/WMD
         Bt2Hqafxlbbu+pG3rqrCf6Krn3QIZzN3oO4v90HajSAlgERlvnt9NmkuusF4z2Pmo5lu
         dErg==
X-Gm-Message-State: AOJu0YyuB/MU1JvgBeSLPw12tqS82PtZHwHrDrR0bmZF1kfXI5hdfW2K
	LnMrbR/jp70rKyeTnXTIv0r7czGenG0bMu7hsuTqdlhpdDZ+8DCt5EII
X-Gm-Gg: Acq92OGk3TS0D/3nu20Ny3AlbJOxBpLZwa8q99S0UM6Dqe9htdL46BbNWv2cflvjj6y
	/PBAnHyaD3uAKWud9UNgiFEeY7/frOnO6whyDxUig7bAJ0yjRVbpLq7g4BkBNLfWsaN9SalFDc8
	r6uIOsDRMt8xbKdZxgEOThkjdG0FxqBuXBzGnARtmxwYWqENGG/2xZnmbJnR5XxajlyGy0Jiqg9
	UatVnKJZA6CYOPBJOXCPdKp8VcZ6r05h0X4cQcZJBn++BvVGkBGu+oLbEpWKkJqtHFIXTvHJnwe
	ahMJrxLSfeCz1U0QrD50eZ1pBU9zt9UuJWr0dwna8X7AbVDDg2v/4EmbModfeITy8WxIJJE8v82
	feZ4Hx8j+tMYXgXi4N15h7vlLgfflQZkmnujo9fQ2vRO7gznVFgjDQ0MHhCAagLovxIpXjqRXrq
	torQ21s0IgZTXDD3f4jx7K8bGk53SVjx3/w19XY4YBA08mJ2dDdQ1WhjGbPXDAtClHeR+RdHH56
	UrqJ+oJ2AJ3
X-Received: by 2002:a05:7301:2f88:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-3077b7c6086mr10163640eec.23.1781006646938;
        Tue, 09 Jun 2026 05:04:06 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm26890139eec.6.2026.06.09.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:04:06 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 09 Jun 2026 09:03:56 -0300
Subject: [PATCH] ASoC: sma1307: Fix uevent string leaks in fault worker
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-asoc-sma1307-uevent-leak-v1-1-cd7f5b062ab7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQrCQAxA4auUrA1kGpyCVxEXY4waf6YyaYtQe
 nfHdvkt3pvBtZg6HJoZik7m1ueKsGtA7infFO1SDS21kSLtMXkv6O8UmDocddI84EvTE5mFWQO
 F2AnU/FP0at91fTxt9vH8UBn+P1iWH69AFNt8AAAA
X-Change-ID: 20260605-asoc-sma1307-uevent-leak-33c33e10167c
To: Kiseok Jo <kiseok.jo@irondevice.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4538;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=jZVaJCpdJPCmA7RMD7l6HhgA0fLolhoJy+4MYoGPoWs=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkajMbK1RIc0xzFF+j5zEl46Fq2LPrDLYaMNQl/Cgpv7
 Ekt1HjbUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABOZvZyR4eg2xgMqG/kia8Mt
 utvZmsNdm1bOm7VJTns6y9zCd8n59gx/xYRC7dluJK00a/52XLH0bbZIxT5BJl3J1d1VT3KmRRl
 wAAA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

sma1307_check_fault_worker() stores dynamically allocated uevent strings in
envp[0]. Several fault conditions are checked in sequence, so a later fault
can overwrite envp[0] before the final kfree() and leak the previous
allocation.

The same flow can leave an OT1 volume entry in envp[1] while envp[0]
has been overwritten by a later non-OT1 fault, causing an inconsistent
uevent payload.

Use static STATUS strings and a stack buffer for the optional VOLUME entry.
This removes the allocations from the worker and keeps VOLUME tied only
to the OT1 events that produce it.

Fixes: 576c57e6b4c1 ("ASoC: sma1307: Add driver for Iron Device SMA1307")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
base-commit: 70eef21e8890f81f1b79733259bb23de394f1e30

Best regards,
--
Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/codecs/sma1307.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 1de6bd1e4ee7..c52fe95b30c6 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1592,6 +1592,7 @@ static void sma1307_check_fault_worker(struct work_struct *work)
 	struct sma1307_priv *sma1307 =
 	    container_of(work, struct sma1307_priv, check_fault_work.work);
 	unsigned int status1_val, status2_val;
+	char volume[sizeof("VOLUME=0x12345678")];
 	char *envp[3] = { NULL, NULL, NULL };
 
 	if (sma1307->tsdw_cnt)
@@ -1607,7 +1608,7 @@ static void sma1307_check_fault_worker(struct work_struct *work)
 	if (~status1_val & SMA1307_OT1_OK_STATUS) {
 		dev_crit(sma1307->dev,
 			 "%s: OT1(Over Temperature Level 1)\n", __func__);
-		envp[0] = kasprintf(GFP_KERNEL, "STATUS=OT1");
+		envp[0] = "STATUS=OT1";
 		if (sma1307->sw_ot1_prot) {
 			/* Volume control (Current Volume -3dB) */
 			if ((sma1307->cur_vol + 6) <= 0xFA) {
@@ -1615,8 +1616,9 @@ static void sma1307_check_fault_worker(struct work_struct *work)
 				regmap_write(sma1307->regmap,
 						     SMA1307_0A_SPK_VOL,
 						     sma1307->cur_vol);
-				envp[1] = kasprintf(GFP_KERNEL,
-					"VOLUME=0x%02X", sma1307->cur_vol);
+				snprintf(volume, sizeof(volume),
+					 "VOLUME=0x%02X", sma1307->cur_vol);
+				envp[1] = volume;
 			}
 		}
 		sma1307->tsdw_cnt++;
@@ -1625,48 +1627,53 @@ static void sma1307_check_fault_worker(struct work_struct *work)
 				     SMA1307_0A_SPK_VOL, sma1307->init_vol);
 		sma1307->tsdw_cnt = 0;
 		sma1307->cur_vol = sma1307->init_vol;
-		envp[0] = kasprintf(GFP_KERNEL, "STATUS=OT1_CLEAR");
-		envp[1] = kasprintf(GFP_KERNEL,
-				"VOLUME=0x%02X", sma1307->cur_vol);
+		envp[0] = "STATUS=OT1_CLEAR";
+		snprintf(volume, sizeof(volume), "VOLUME=0x%02X",
+			 sma1307->cur_vol);
+		envp[1] = volume;
 	}
 
 	if (~status1_val & SMA1307_OT2_OK_STATUS) {
 		dev_crit(sma1307->dev,
 			 "%s: OT2(Over Temperature Level 2)\n", __func__);
-		envp[0] = kasprintf(GFP_KERNEL, "STATUS=OT2");
+		envp[0] = "STATUS=OT2";
+		envp[1] = NULL;
 	}
 	if (status1_val & SMA1307_UVLO_STATUS) {
 		dev_crit(sma1307->dev,
 			 "%s: UVLO(Under Voltage Lock Out)\n", __func__);
-		envp[0] = kasprintf(GFP_KERNEL, "STATUS=UVLO");
+		envp[0] = "STATUS=UVLO";
+		envp[1] = NULL;
 	}
 	if (status1_val & SMA1307_OVP_BST_STATUS) {
 		dev_crit(sma1307->dev,
 			 "%s: OVP_BST(Over Voltage Protection)\n", __func__);
-		envp[0] = kasprintf(GFP_KERNEL, "STATUS=OVP_BST");
+		envp[0] = "STATUS=OVP_BST";
+		envp[1] = NULL;
 	}
 	if (status2_val & SMA1307_OCP_SPK_STATUS) {
 		dev_crit(sma1307->dev,
 			 "%s: OCP_SPK(Over Current Protect SPK)\n", __func__);
-		envp[0] = kasprintf(GFP_KERNEL, "STATUS=OCP_SPK");
+		envp[0] = "STATUS=OCP_SPK";
+		envp[1] = NULL;
 	}
 	if (status2_val & SMA1307_OCP_BST_STATUS) {
 		dev_crit(sma1307->dev,
 			 "%s: OCP_BST(Over Current Protect Boost)\n", __func__);
-		envp[0] = kasprintf(GFP_KERNEL, "STATUS=OCP_BST");
+		envp[0] = "STATUS=OCP_BST";
+		envp[1] = NULL;
 	}
 	if (status2_val & SMA1307_CLK_MON_STATUS) {
 		dev_crit(sma1307->dev,
 			 "%s: CLK_FAULT(No clock input)\n", __func__);
-		envp[0] = kasprintf(GFP_KERNEL, "STATUS=CLK_FAULT");
+		envp[0] = "STATUS=CLK_FAULT";
+		envp[1] = NULL;
 	}
 
 	if (envp[0] != NULL) {
 		if (kobject_uevent_env(sma1307->kobj, KOBJ_CHANGE, envp))
 			dev_err(sma1307->dev,
 				"%s: Error sending uevent\n", __func__);
-		kfree(envp[0]);
-		kfree(envp[1]);
 	}
 
 	if (sma1307->check_fault_status) {



