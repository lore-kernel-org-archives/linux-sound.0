Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988351A23A0;
	Sun, 11 Jan 2026 00:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768089612; cv=none; b=TsynTQMZc8QoMUnsQCH64+wc1M04N0o3ACn81465gu3MP3tS0MkjAJz0399x896I8DpPYgM2++KuDXZM3TEC0qV+jnPfVRJZ5pLM0OIK61XEMgdhADZh3iAHe5HPilfHEmGnbeGXQ2g3b98d8ftmR8SyX9Ju2EjUKuT2MPx2glY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768089612; c=relaxed/simple;
	bh=55aA8j2c6c2n333KZtu8W0/aRlrm33Rf1VNd7QwdV0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VH2tCfLFAue98tGvjjty8zpPSdnHVs32ovH4O4UqogpZ6iQhyvqEQ+1QMZN/hmb5TWc6jkMfgh0HBQ/i8j40gQ5JxQvHxcFC9Ff0jvYjIjbtcgOUiDAqW7VJUDGRxKfBFWcwxWGh6Y1LUjuzwZgsdp9+nk2/EmTd4bRFvTpOVJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMhopXnr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMhopXnr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52C44C19423;
	Sun, 11 Jan 2026 00:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768089612;
	bh=55aA8j2c6c2n333KZtu8W0/aRlrm33Rf1VNd7QwdV0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rMhopXnrumCVlpGUjEFLjobvXwPLNiGqDB8fMiU43rpp3chfUnDP/oYkZ36hkKqLQ
	 G7ADJ1I76ZqScYPHFbj20l7cEmP44K3zbkX1gJjOvFbyvtYSAF1XXaejML4bsZNrD7
	 9vbUR+LIr/IIATvg4hwiA4RWKzlVwerRlMD3LFKcMlCHABDlNu1lYoNVKS2DOzuz3x
	 SXtNcF+je9a4NLvwM+xk7csjHUo1/O7d+cMKphMjYyziDEmP3z91jnryKF9ALdnu1/
	 nok0elfldkQRqZvffqE0FnRgZ0M3cDL7v6/9ZSJp3rqOUvmP/BsG8haEBFX4gb42g6
	 FmBaXSH8babcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4902BD2502A;
	Sun, 11 Jan 2026 00:00:12 +0000 (UTC)
From: fenugrec via B4 Relay <devnull+fenugrec.mail.com@kernel.org>
Date: Sat, 10 Jan 2026 19:00:03 -0500
Subject: [PATCH 1/2] ALSA: usb-audio: presonus s18xx uses little-endian
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-preso_clean1-v1-1-ce2dd3ea4506@mail.com>
References: <20260110-preso_clean1-v1-0-ce2dd3ea4506@mail.com>
In-Reply-To: <20260110-preso_clean1-v1-0-ce2dd3ea4506@mail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 roy.vegard.ovesen@gmail.com, fenugrec <fenugrec@mail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768089611; l=2168;
 i=fenugrec@mail.com; s=20260110; h=from:subject:message-id;
 bh=WJN0yhiG1j4vHNz0+SA/JtlqWv9qDK7SQEwjzaVHRk8=;
 b=gb7ZjqqBsuBWh/jKz9MsNA1ca2hgaoRK8Er6IeKtug1vB7QM2TPE+hO+J8cocjNvWdUzR2Vez
 Pk1XJehY2H0DxctV64B2Oj7YpJPAE00qEUvfYR5C1uELIK2OXWWO6sE
X-Developer-Key: i=fenugrec@mail.com; a=ed25519;
 pk=lEWyQQHFuqFAWupzIuoHgEvr9FgSscJjTpmL97lrmOE=
X-Endpoint-Received: by B4 Relay for fenugrec@mail.com/20260110 with
 auth_id=597
X-Original-From: fenugrec <fenugrec@mail.com>
Reply-To: fenugrec@mail.com

From: fenugrec <fenugrec@mail.com>

Use __le32 types for USB control transfers

Signed-off-by: fenugrec <fenugrec@mail.com>
---
 sound/usb/mixer_s1810c.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 6e09e074c0e7..fd9b4d11c7b2 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -82,13 +82,13 @@
  * mixer and output but a different set for device.
  */
 struct s1810c_ctl_packet {
-	u32 a;
-	u32 b;
-	u32 fixed1;
-	u32 fixed2;
-	u32 c;
-	u32 d;
-	u32 e;
+	__le32 a;
+	__le32 b;
+	__le32 fixed1;
+	__le32 fixed2;
+	__le32 c;
+	__le32 d;
+	__le32 e;
 };
 
 #define SC1810C_CTL_LINE_SW	0
@@ -118,7 +118,7 @@ struct s1810c_ctl_packet {
  * being zero and different f1/f2.
  */
 struct s1810c_state_packet {
-	u32 fields[63];
+	__le32 fields[63];
 };
 
 #define SC1810C_STATE_48V_SW	58
@@ -143,11 +143,11 @@ snd_s1810c_send_ctl_packet(struct usb_device *dev, u32 a,
 	pkt.fixed1 = SC1810C_CMD_F1;
 	pkt.fixed2 = SC1810C_CMD_F2;
 
-	pkt.a = a;
-	pkt.b = b;
-	pkt.c = c;
-	pkt.d = d;
-	pkt.e = e;
+	pkt.a = __cpu_to_le32(a);
+	pkt.b = __cpu_to_le32(b);
+	pkt.c = __cpu_to_le32(c);
+	pkt.d = __cpu_to_le32(d);
+	pkt.e = __cpu_to_le32(e);
 
 	ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			      SC1810C_CMD_REQ,
@@ -176,8 +176,8 @@ snd_sc1810c_get_status_field(struct usb_device *dev,
 	struct s1810c_state_packet pkt_in = { { 0 } };
 	int ret = 0;
 
-	pkt_out.fields[SC1810C_STATE_F1_IDX] = SC1810C_SET_STATE_F1;
-	pkt_out.fields[SC1810C_STATE_F2_IDX] = SC1810C_SET_STATE_F2;
+	pkt_out.fields[SC1810C_STATE_F1_IDX] = __cpu_to_le32(SC1810C_SET_STATE_F1);
+	pkt_out.fields[SC1810C_STATE_F2_IDX] = __cpu_to_le32(SC1810C_SET_STATE_F2);
 	ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			      SC1810C_SET_STATE_REQ,
 			      SC1810C_SET_STATE_REQTYPE,
@@ -197,7 +197,7 @@ snd_sc1810c_get_status_field(struct usb_device *dev,
 		return ret;
 	}
 
-	(*field) = pkt_in.fields[field_idx];
+	(*field) = __le32_to_cpu(pkt_in.fields[field_idx]);
 	(*seqnum)++;
 	return 0;
 }

-- 
2.52.0


