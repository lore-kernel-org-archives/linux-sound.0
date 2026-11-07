Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062075;
	b=uDlGKda3ddDgiZP+ESUCVbd9PrICcxVtMY6DPFGi8DAI4wniMS0nQ1FT/mA9URsXluJT
	 3/IrXvs7qvsW0DDOYNLdJXf/7KBJlbZVOX8dcaQ7Taq4WOJr7SSLSJ2XEF9SSYlgqFPrW
	 gfs0jDIpSkwOepRzaiLjQB2QEvacUp5k78QUUfSOutM1jCZgHo5HGKbeRM9PUXYsGYnle
	 frCksA1o477VsOmuTNwmdAzEjbiyGrk+apDRTN2OvxP3MI6dG3hBMoCK10NkLiLxAllc8
	 RfCmaSwbXI0J/3LOaXLCUDGMFIUXisAQNtupWjdjK1njWLcs9BtHO2ftYDIPjxO4Fxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=FO0XRovd3auatp2W5wBwBnwzJxMPaEWHCppzhdyYbx6p4FRANM7wAg65YRwXcqSZMLbS
	 m9xvERkw3kX/tTBshOcuxuSZwN86lIivvylWeNt9mDV4a9g4kUgKquo/Tdi/bqfVFy6Ay
	 YbiEXMpWUiLeMXMkyLAIbvj4BK1GufpsxMtm6Zfk1bN4Bi+wp/2SOrrsZEXbZhcorSvQx
	 r51WT9oPixhNl4dZcvAZBYisKel28m4yNtAGYdYiWHfmhyo19LTfFBDv1zhWufWoaScTd
	 lvlzWbT5L9IeavHY8EDYvl/9tsyTyXi/2nHBnZLZ0kDKZhT3sZ4xKbQgOccmslKfUAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ohn7h6X5;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53A606D839
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 14:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B53A606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ohn7h6X5
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so3171668eec.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 06:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062074; x=1794666874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=Ohn7h6X5HCgN6PCcyOM2avE0mv67HWNEtJ89d3seCgzLfeGvL26NSLFz8ESNHqGrJr
         oJknUm+IuhHB4q47llEwlRd3W4rYQNgnhfE+e5mF0EkgJWlS5Wtk50IKsLxtiL3T5jIa
         5gJG4PKQMgSK+dM7ihc3rClNsRCYdjEHdi2F6ja+nCZgzmoPmwYz8CHUwkcXBAzNTCa3
         wqkYgux9zJDaebbtz3uO6zvM288xgnWNPfrDophZEb2I+3Rys8q68ACp7VLZ6W3nhuoO
         e6VxfnpvfAtd1lrylodR4i1ll54dvJRvwAUnVNtFB7FPbOlBq7ZKEJRPp36SKG8M3+4M
         aD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062074; x=1794666874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=DE/wehgUSK2KPje+2IOmAXX607OQgxs6rh1x8BLSy1qsp+UqYvEAyBxpuA1QqXICWb
         ltHeSEWoPf12laEemusZNufGu5EZNQYqk0H0fOVYuOVN6WOHmE2/3xJfaT8if2TR1Tk/
         znp3qJZo6CXIzXqUqsPeZNSSLKsbQ+vyhwshi2RG1RNfwIdL/o/eMDB+ADGZkVqsu98U
         V3qwb7m50332DZomATW6KgxDY8ZMn2TTvK0iHBwdYRoZu1RNJWiXa9unF+hurAC+XEOp
         maUqlCVBrP9tDFDmXfrn0ezJg2OhvNkOaZsna4gpdSQAnnHVXuuwIcljUghFrYfo9zgX
         S+/w==
X-Gm-Message-State: APuU4Z/jMIQYfxRbgGCvqaV7sDSZ5Mr9+CtZWvwQCXut0KbcR+GJB43U
	gITvJg0cRzzaWkIcdJL3iYy2zW+AxQa6ON1o3w8ImHkwFy9rvQ6ccnaqYIArlPuG
X-Gm-Gg: AYBFou2MUU88JU+qZngbfdkFg57qrfwh5IZWx49ZBmkJoP0Qc1nlyoufZtOwS7xBOkx
	OhOgF70y4aJW2s3XwMFa3EqhqdWE0Qjv17BnYyf114q1wZ7fFkEorqnf5DKocwvK/iV++XFq3A9
	1htQGN2q2780SH8LzSygyTiWkghYcl4TBngK/tnJ9jN3Tm4jlYfdA6rdaV/fGH/KWt2i0n5Crah
	JY5ROFhrprXnIP0NX+oF0PTmj+WGJa1ulxKOh09RNCPXhJx/7lEDcJnkYQuuCvkBBbrIiy/5CyL
	euqeWvMsbiQ3bzIPHEYdon1jACiRlYMdynv6AxvxpLeRXbNA0Wp4Ukhmp47L69/IT5p8T08p62d
	+hoBqCI7k5LeKe/gVdQjiRTd900rVBRbOcQV1WBZ8g/x8Lq2RFJhanHeLCAgnj1pM4JNg6IGGDE
	oBxQT6KE39R3ub/8Y+ZlByDoJuxvWrFZjdEGbQRyfmFIzUcEfmvrlEg8QgydMQOSsRV2i/AECFr
	seNSwly97oXfttf8zY9TZULyDSbgY/oSdSLGRMUFSC/KJlvaePClq0gfEjJVWvpBeRWzFChisnS
	QtOjHCqNm45d4Fvgu6loUvlZa+lcjpF1rIQDMvu1ZvS/Lh1kh0QpY/c1He3Ut7xGUP8pTmGVBhD
	N0dWMvXAMNFOL7bDmKKrbIsK4UcxMYKACQ7M4QCDQ61bf8Q==
X-Received: by 2002:a05:693c:6096:b0:36a:1b62:da with SMTP id 5a478bee46e88-36f75440a42mr9647838eec.12.1794062074059;
        Sat, 07 Nov 2026 06:34:34 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:33 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v20 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Sat,  7 Nov 2026 23:34:12 +0900
Message-ID: <20261107143422.29319-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
