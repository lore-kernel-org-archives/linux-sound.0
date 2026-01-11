Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E313B58A;
	Sun, 11 Jan 2026 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768167410; cv=none; b=mDeCyjiJcR6KIlmpJihLMYoSJEBbJHeum3/n42nEu/Z98rydqOnTdA2VGqr9EFUyI/igdpM6e4wKmaHMPrujaJvyB+Lp4Pzw4taqQuHHkf2akmNRMTiwLaLuIZx99LMB51zF3TZmJ6nZqnvBwDTxVLNWHgXE3XjCaCaP7T+Otno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768167410; c=relaxed/simple;
	bh=JsrpsJOJxoM1uVDX0crSzyfo2WhYOlPJq4u7fjRtP7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQ5RxI8bupeB+EWTotKZ/EWtkbgI//KDXB+OaaV5TOeWYKsbKjiFEwVLGhAQvbwSdTO8B8mLcxNlhuXpnf0rQIc7k9fqrHn5sxwK1qi2akYds4DQqnghwhF6nNn+XeHID9gQJhJ9CplIY3xNyysIVcuorOYbn0EyKP1Tj4CMAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdQbh4q5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdQbh4q5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D60D2C19423;
	Sun, 11 Jan 2026 21:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768167409;
	bh=JsrpsJOJxoM1uVDX0crSzyfo2WhYOlPJq4u7fjRtP7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PdQbh4q5xHGDnTrWF6scbsYs0fiq3gewPFZbN3BIVCciMDxmbrn7swp418L5NRkHR
	 EJzV9nkszMKwWge9ACM40BWSdsfHcqsEBIYEP6fTdRMCjhK1eS4TTHPNqRNvE3aL0p
	 Dm2LYxXg+lBRJbNNQCfCTG0s6HNNdJVfx47C9cbBsE3pjiAG3srxrMAqRtXsB2zU2Z
	 KAYUTmmmol63Oa+6FYHtV/s+nJr5YO70lsYL9vDgrCgeRoLAE0EJHc8kXku/bHmsa4
	 vRoRZgQ9VmFCj1V1MxnhO+NuML2mKUmndNIB1DTFJKL1moRdejadfv/wAtiFUAaS9W
	 DXHC1qnYDG1tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41B1D2502E;
	Sun, 11 Jan 2026 21:36:49 +0000 (UTC)
From: fenugrec via B4 Relay <devnull+fenugrec.mail.com@kernel.org>
Date: Sun, 11 Jan 2026 16:36:40 -0500
Subject: [PATCH v2 1/2] ALSA: usb-audio: presonus s18xx uses little-endian
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-preso_clean1-v2-1-44b4e5129a75@mail.com>
References: <20260111-preso_clean1-v2-0-44b4e5129a75@mail.com>
In-Reply-To: <20260111-preso_clean1-v2-0-44b4e5129a75@mail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 roy.vegard.ovesen@gmail.com, mickflemm@gmail.com, 
 fenugrec <fenugrec@mail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768167408; l=2326;
 i=fenugrec@mail.com; s=20260110; h=from:subject:message-id;
 bh=8P3tKjfthpc+uL9YV2TXD3wzFIRjHVY7PbgXHqkhu3o=;
 b=fB8bl1am8yHZjlcSnZRASlCNx4tfirjYEuG1QozizAtGqdDzqzQLBSwxaclfoGTHZUQjDbX8X
 APHDxQYlNwxBBhlr7O1wp7ErqkkrbtcBvSNUQc/6SsxARl0WxRUBb0H
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
 sound/usb/mixer_s1810c.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 6e09e074c0e7..93510aa0dc5e 100644
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
@@ -140,14 +140,14 @@ snd_s1810c_send_ctl_packet(struct usb_device *dev, u32 a,
 	struct s1810c_ctl_packet pkt = { 0 };
 	int ret = 0;
 
-	pkt.fixed1 = SC1810C_CMD_F1;
-	pkt.fixed2 = SC1810C_CMD_F2;
+	pkt.fixed1 = __cpu_to_le32(SC1810C_CMD_F1);
+	pkt.fixed2 = __cpu_to_le32(SC1810C_CMD_F2);
 
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


