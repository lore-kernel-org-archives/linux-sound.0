Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981932;
	b=FeYiJ9RIlvpeSqmEEq7X4PKuQCRLXqhKjl/jSVxbtdvn2/fwwv6g3gyNHpwhT3NskbEh
	 2ezTAk7+26kW1XnIn26Oi/79y1Z+07aYxCOdSeklXsu+oovQ2SzuNvTRLOE1CvymR8guG
	 lVQS0UTPBwdTUx7potrfkc0h6VCDxriLcJ6BGCPw2R3yJRgDdCL5BZ3vqznIYuHgcMMKy
	 Cl2I8kErk3MPVQCPpoQDXiFCx2Na372/7wHQVsMXXzBWvjroVHRVa6dfZVf1tzi4e+XmQ
	 +Cy+V5cZj23x+K+cRVm4/ZHndwEcIvGmD2SgIIskUG8hF1e0VyycCdiJfYzQiew25iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=gJo3ghLl5GonEkkoH9jKDpT3TgJQOkoz0Nxbu2WZpNDpAdxk6GDz8J5fHOE52e5QBQmI
	 TUj2OEl/ShPHwL8ZN2vXP1oZIG+Lf9xwGrCuF7r8hIBIziV7EXVUaE7hS6waXcAMdi4Cw
	 dFEjR4uiRxaAnXDBZJma8wdZgplPLOrNrXuK1ydzwTVbjILz3bcHLnEwWEX3KTk9ZwonL
	 S0JQtJt1WuweV9ZR91r8P4gQl36yQQPYwfCbxbhbkc8EQadV2blDqj9URT0Wb8hpJCg4U
	 lHh/d94EDI57pjA+VkvocyyPkb2EC8RIWUrN4pZLZj4vGRINOWHc+4shrGV0cnsqNrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hG9varOW;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF35606D802
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF35606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hG9varOW
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b244fb7fffso1382803c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981931; x=1794586731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=hG9varOWFRVuV6LI+jW10ZhVS1RPXr+sYEnAs3cEGaiueJVRa5q+eNCwBCU5lUi4bX
         onWnntWlKYEVvtNTHV1XkK+/2kpWwuBKGm4sX5rD+qDc5PK2enfDjAHXDmZhiy77yQ8Y
         RLXdE9RSpefZqCNSMjx6u68GwfvnqzTK5rgVQjnmJ42ROoEGt8PzocMT2T6nn7qR0E0k
         IkrqOjzv1hduUXuNG4jF+fkkC/rlMSacJV2OazF4fGeDnBD32JtHlzG1QspxO8sPo5W4
         R6/gP7tDhF5Tf6hecup88uFns/VLVHKitk2iFJzBF96PR5VLCo8eCmYQVJ1Xx37/OC5M
         Pa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981931; x=1794586731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=ISt9fIaP8GyyZHsp9XXxAdSa9C0NlIL+cFNCIGQsAshquIZzEWObep0Nudj4faQiQt
         7DZ7UaQrtR3EDZgPSmkp1zygI56whjU1whu60gRFcV8+xdDHMJFHyfrzTfH1qjK0lgHh
         0QjSMQUyvvVMgcfFO9u/kOPIs6zK8MlDm7wyoKuKo019GJHPxfvwVxZ0lzjuRd6iAd61
         j2WGvp/Ke+8HRTSIsWUyzQHhDPOAtIV6GEgTTRsSNAP0e5N46w/1RBiKx7xnvpnRLye6
         X3aAyLrGKuziP1gtBJOe1mASzRJzb3C/p2+7Ayxv4ibWEhAf3/55z/HYbHojj3DtLitP
         PpCA==
X-Gm-Message-State: APuU4Z9wteQ42JA4YbEDQ/T6LDTAq1UD+yB1s4CYBrs6YFAB/vuAyRLh
	1dBahCU/zuW9An/igT6KrE4xMvKIzmvV1+8xoiqy4CQ3KXHtCu5QmRAXpXXwVDrH
X-Gm-Gg: AYBFou1LVSQYLhiT2fyHVImZWqIXgBcwEKoBSOPLJ5T4Cm76fe4Vn4iPuDhTk0IC8iz
	gFahPhKMLCzOYT73ECP3OME1TBrPMxgVSKSgCVJHK+Z20ymMDVsFpyquSeycno71Q1K8Q9Cg7LE
	x//oQzjiQMRArsIpgNiqBtiQrH4u2uMK5VOXvvt3zZBrpSmHxE5dsesgwVxRKUbJJfwjIgsCzMa
	8tDWv7/L8tckTr9w7Xf3PAA3e5VK7zrC4/qUT+XiVhdwhQGAwD7/h/mjZc2+ZIjIP9d3Wy32xcV
	jv/f7oOQz2SiWjq53HLdhpSetPcvUnaYhvP0lVrenVRJeCH2J0KikLq7+Ko1JiAcmvu8LyjzSFN
	JxvmerEG6dsALet1QdEDt50PnRwGUCgE4Lxceqh/hoNhZpYglEmiREXbN8gIYbYJI/Y+JsEmjvf
	gGmlAOaoGa/o9MLM2aWJ+oNyRMuaFDoAjJs5idgy2AjkqcmdvTpEStzgEZloFHCjece8UZcGawl
	FlKaSgwwLm1SmfE0CYTiS3ltL8p9fYZxA8I9zpw+Lq+TFRbdAteeuFnz/FSGSeLpuKZvQjAfGdx
	oilXwN1O+MA0ArObAv1bGyUovslVVkR9j8TpCRRhu0UQK/cy0xqjnHSArLk2qrwg0I9jqtmzVYU
	xUJbA4myVTw929Io6DJarOhhZWMa2w3ooml2yTTgUDWm/tP4=
X-Received: by 2002:a05:701b:2505:b0:176:a225:e364 with SMTP id a92af1059eb24-1b25d38aaafmr3408405c88.35.1793981930826;
        Fri, 06 Nov 2026 08:18:50 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:49 -0800 (PST)
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
Subject: [PATCH v19 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Sat,  7 Nov 2026 01:18:28 +0900
Message-ID: <20261106161838.94308-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
