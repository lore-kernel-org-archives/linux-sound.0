Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3505F1422DD
	for <linux-sound@vger.kernel.org>; Fri,  1 Aug 2025 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754063283; cv=none; b=X6cbfbirjxIQlJQN3F6/DVFZgwodFE+baETFuSshgdwAi1XOwftw3m0w90hBhdQ10upjp/bFWUFgpNkkVBMmEUi32EsBPhkqxa2+AMnArqQp0OBRz/F2x21r4fvZ3VGg8dWcWp8V//e92YSGLin8xAQGq2wVFGe4c+anpdDd8p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754063283; c=relaxed/simple;
	bh=J8kNE3M4KMnaGiwJc0Y0DX8xCE63Cunt0nVNLh+91GE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KpVcCuQn0cGb8RV43eGH+3UUEbN5Jav3Cz/4ApEdWX6aiN+b4/1DIHi3ITQEBt4zerXTOKnd6MoUaj8YUMrakxLSIlB1JyEPv6c28/BRAWTMVK3X3PsYbjSSoZO4x3V0jwUVDDl622MEuGK9P7L/akY2o405RqXUgT6MH7epR3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dZICWx0g; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dZICWx0g"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754063279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JsFp9eC4npbziHlk8jxpTi0iJRPCG0xnW8Hvy7cexHg=;
	b=dZICWx0g57n7gei9IiQOT+IyrFqPGaTVPlySQmfsoZsrp3t39qnyu28hmIUmp/2Lt53xtf
	Ec7AGnrg0JzdMr2FC4xOjVTI8apT/IX8WEMmna2dLIuZDX2AJmv86RBwLjKRrqC2hW2Z1H
	QVgUer3ilzVQN9qTMOkO5OvpR9ARHFI=
From: Sean Anderson <sean.anderson@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] ALSA: usb-audio: Don't use printk_ratelimit for debug prints
Date: Fri,  1 Aug 2025 11:47:10 -0400
Message-Id: <20250801154710.739464-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

printk_ratelimit is deprecated, since it shares state with all other
printk sites. Additionally, the suppression message is printed at
warning level even though the actual messages are printed at debug and
are (usually) invisible! This can result in thousands of messages like

retire_capture_urb: 4992 callbacks suppressed

in the console, and can inhibit debugging since it is unclear what the
source of the suppressed callbacks is.

Switch to dev_dbg_ratelimited which doesn't print anything unless debug
is enabled.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 sound/usb/pcm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 08bf535ed163..96339594dfd5 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1280,11 +1280,10 @@ static void retire_capture_urb(struct snd_usb_substream *subs,
 
 	for (i = 0; i < urb->number_of_packets; i++) {
 		cp = (unsigned char *)urb->transfer_buffer + urb->iso_frame_desc[i].offset + subs->pkt_offset_adj;
-		if (urb->iso_frame_desc[i].status && printk_ratelimit()) {
-			dev_dbg(&subs->dev->dev, "frame %d active: %d\n",
-				i, urb->iso_frame_desc[i].status);
-			// continue;
-		}
+		if (urb->iso_frame_desc[i].status)
+			dev_dbg_ratelimited(&subs->dev->dev,
+					    "frame %d active: %d\n", i,
+					    urb->iso_frame_desc[i].status);
 		bytes = urb->iso_frame_desc[i].actual_length;
 		if (subs->stream_offset_adj > 0) {
 			unsigned int adj = min(subs->stream_offset_adj, bytes);
-- 
2.35.1.1320.gc452695387.dirty

