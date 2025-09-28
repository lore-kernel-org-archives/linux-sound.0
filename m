Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236A280CD2
	for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 11:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759059513; cv=none; b=QOg3ouxx/hnkDaz5CeO5SCogERkwoGCCyH1EYijmG49ieIfj3dmsxzYHpLogjX9KzTfEa6oLYGUoG9YjCXUEbcfPrG2mpe5atT4E8UpAHcAOv0ggcwKHPdaTGo1VKFstFzAz/wTzIq5bqGULmpYa7UGJatQwRtN2E9ikcOkXbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759059513; c=relaxed/simple;
	bh=4MXRVns1UY39GE6Y2TxziKyHDEdvLIWcmGE0xpyO9h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sk64to5oFt0Pu4sf+DGaX+x+uGYNBQmckxpMjLYwaLD8zvAbgMPVAgjyP1L35GAvsm3R/75y1rNaEYZ9HeoKjtoIA1C4RwvVEF/E4+qnyaijHLqYIrzFO+d54GB+AqJN7IHP4hRXlp1OAMLEecochnj0OxVqUMpF7nSsmL/Bc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFcjpk4C; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFcjpk4C"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57eef777d3eso4140238e87.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759059510; x=1759664310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2rzziQQ60a4eINEZ7sFXamRwpnSN4K42vHHpbCGuK/I=;
        b=IFcjpk4C43623hC6yogiiKUBmEpIijCP87SLrOqI2VVt/YKYuV8uP52ytFdYYNG6vP
         9qJN0tN/zL1i8I+WHhDZuq1bpRjwznjg3K2h0B9FHrKSfKd6ji2wV99+C9a62RcY95oy
         OsbsH9AwTiY5sh8E5W8bp8HP22g4550iHbj+vDE7o0ZZwq+KiwFL5lP83BEmB84hXfP1
         poJhF3zbY1jPpzbC7Ubgn9Lp3r8tA7eokOCCwL/kGyZDrOMiq3zeMcZC4gJKUPmiZdx8
         SlUpFKKYzc7xRMtBAd62fY6bsDjvEBlR9CI0oxhyj5/ggitdDibQm/Kkc7NVLnS2PK5V
         07Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759059510; x=1759664310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rzziQQ60a4eINEZ7sFXamRwpnSN4K42vHHpbCGuK/I=;
        b=rhj78c9DHE2scb9o4lAWBPkA1nCz4z8NNT2xJdYkV9tJCc8yvg0AAKfpmvPENgOc4/
         qmPEAksm9xHy3/aCK3vYp2Gt2x/GMmmbvjCMwft9wf/lTS4Tqnqzpk+jKWZvKsXPPTd9
         kuLLMx1IJ5ET34O8hMdYbkVXzBSkDWtQXGdRPhVuW7o67jmFATUaMxpGjw6+689xA3Ki
         DNtmGj1yDBqyrCPTjvKk67D1L03HGma8PQC9sWGH65j64kHlD9MiqsNEbEQt5gz+x9Vf
         Ve7TuPSpyeebRds3ecgCc0ArCmNlnfBkTXDv5HopU3cseQAIcO6+JgMBExDWBEBi88h5
         lhgg==
X-Gm-Message-State: AOJu0YyybD0MkRooIlMWDHK+3IDPzaDTxzS8/Icw7fdwJLZjAH4WdbmA
	kQ8QsiRJBLXnCLx4y7AyJLMR6FsoiLiP2bohu3UOClaqbDsiG5b8n3btOcw60SXg
X-Gm-Gg: ASbGncst+KLSmLsDNARBPcpIXZ5knrazjOIC+WRu7yVO8MRt+q2PPobXf9HWzgCJmoU
	lIytgvjzukk4edeFUyL+85tRHrVjXILKtTyzXfEYKQsJmvn7uaPBanj2TZNE7crlxsWS8bz6jUn
	k05v26q6bztMxeLNDKk+s0mUySylykDaA1ED9NEkqnVN9i0cZG764DjGZ5BcjSlrAXtjZFuduGH
	9bb7g/bvDfDpuMjNeCzn9a/hO7lgS5FgBLnymTHc26Ge1h13kL3ah4noEiM/rYF+UbWY7Yp6mhW
	/AYf+2ZNjSarE7yOZRTaW6+0tuZjt/v+wMq+7VitRYYYUUpxbiZQ4WqhnVzulilWtZoNpeT2rsC
	n0E40sO4PmVmJPgO1WD59jCFSUHAM
X-Google-Smtp-Source: AGHT+IGoIXisWvDh3SVdYm+3oSBppeGy8gtdsIyNmtBpHBr301VwiqiRU4MrLeRTGfxuIY5CNUIqkQ==
X-Received: by 2002:a05:6512:b12:b0:57b:8a82:1dce with SMTP id 2adb3069b0e04-582d12ff484mr3924633e87.19.1759059509543;
        Sun, 28 Sep 2025 04:38:29 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166560dcsm3351175e87.94.2025.09.28.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 04:38:29 -0700 (PDT)
Date: Sun, 28 Sep 2025 13:38:27 +0200
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ALSA: usb-audio: don't hardcode gain for output channel
 of Presonus Studio
Message-ID: <9b3f598105bfad7230fe3ba902cf379ad2ed11e6.1759059196.git.roy.vegard.ovesen@gmail.com>
References: <cover.1759059196.git.roy.vegard.ovesen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1759059196.git.roy.vegard.ovesen@gmail.com>

On the 1824c output channel 4 left/right is the S/PDIF output,
so this needs to be able to be set.

I'm guessing that for the 1810c since it has no output channel 4,
it does not matter what the gain value of this channel is set to.

Signed-off-by: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
---
 sound/usb/mixer_s1810c.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index b2658f922d07..15960d25e748 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -147,12 +147,7 @@ snd_s1810c_send_ctl_packet(struct usb_device *dev, u32 a,
 	pkt.b = b;
 	pkt.c = c;
 	pkt.d = d;
-	/*
-	 * Value for settings 0/1 for this
-	 * output channel is always 0 (probably because
-	 * there is no ADAT output on 1810c)
-	 */
-	pkt.e = (c == 4) ? 0 : e;
+	pkt.e = e;
 
 	ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			      SC1810C_CMD_REQ,
-- 
2.51.0

