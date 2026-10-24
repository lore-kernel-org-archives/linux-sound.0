Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809160;
	b=XPKhfGHlFV5E8vr1uWy0JSFyeN0LBbAu6/vHsSz7zuGhp/fCmx8lxNgbfWM1GEKCnCY4
	 sCqbmKoySmINkWruW4t7Wx000YiF4pYy/xnlofxOy5YVzDNBoUZWWlYfPxbFbVb6KdpOM
	 cf3m/S5JLQK+3suHjxoLSzhs2C5mpRaauNAS5tuByhgzueGvy0tTuO3KQUOHfN5Bd7ZUn
	 MzZr3wL1VXB5BRv4ACspro0Po6ZWjEr91XNU9JRHPE3ue5V2qVdjH0yBqCRAfEkB3f5Ur
	 rc750gpYO+6/H8CcFonxWYYP7nBo9AGWgizYpEUJP1lZHWlLsjpMTLj/TcryGPdPuXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=JOywC98oojDhPYCJEdjy3e+iIyqGoXX6Zpv0NoClFOjeeA7cQArKY2rskE5OITLrYsoP
	 /NpJLt0V0hpV3npC/1+yjULeQxUUUejeriiOaD5TCMKC3KIQn5omNgN8dI+P6hXSOrF5O
	 tdeSTgIhig7YHSN5yiWYJczzzXsj53qhtPFRyozAtkKgMcrZP+ypLMuRv9u/F/BEutVhF
	 LHelpCJQ1Zc1fmV+LjZo++vrHiUBLy2oS9mnQBt7iGpC4cPbC82qxJxZPlgCQPsUkHuHD
	 MzeYE7ccP9Ls5FXbyQlHgiY04AqtWRjoZz3HPCsBixsfI+xUwy2BhztTKod8u/SPxDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MOBAKPOU;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F8606A322
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 02:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313F8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MOBAKPOU
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36681e85e87so3598936eec.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 19:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809159; x=1793413959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=MOBAKPOUyFR9UAchQLxxQI1Ry6/anuEBXVHh9DuCL8eUF7ElBaWpJUfam/l0zBXa/O
         W7rkNwdpm8p/yxMIMGdhtadJDRQ+hktGwYvF5THaPsxgtQhVmXX4UCDaIGOo/X9LoV3f
         HFfPLmbbB5k69gO2TP3WryxfgWw8GdyUgDbLSDZByo4tvNUwGOG0MgV+VYxx+aSutPNY
         f3ekxpVsOodAhyrUD3qT3NvIzW86+8i33+oFqbKzprks1i6tW6B6blmVHmuUTeNh8sWX
         LtC/KNNJ6XkHQ7yH1aKnVqfz2DnA6OxXUH/jRsMlI5++S1iyQM1qV9zZ5s2CgMkHIbev
         /cXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809159; x=1793413959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=MmsVb6InZGDaF7kI3aRHjFKWHJp96dhwTHB8JWu/W4lbVe8EHvag3Fr2tOkeJdq8rq
         NVjXFSF4Qc881V+fCg00qJs3WoBiy4Tkv62mszqt2HvUegDcODxkmGh+0+3/aD1F504W
         llv0I0dgZKy/frd07K6dgoHn+FuKnZxHMMnIekbjiYfwe4ppx4uZ9iLdvBCTLz5lPLEl
         0R3hummGfTxIH8MHxxuKz3Zg9Fi3y7bvG86EHK0WtKk8MvDu5sFr3Aoq2GYU2BH169kJ
         FEykixyi++/1rEa5yFY9q/yuQ3vWh4UGOYJw0sJhLKVRV32soYoUbNlR33Kigkqu4kaR
         5pPQ==
X-Gm-Message-State: AFq9FYLGJXVPXfQVd8uXfSBFhoFWao1o7NwaHAEu05u3qusVRTYzdvl+
	QA+nkOeX8i4GTk35aq1eLW12MdPm78Q6VkPnvmSZGSsfWw+LOqluZ2kBFLHR+eaH
X-Gm-Gg: AYBFou3LfqazXOVFaw1wtlHkb7cXLUAwIk9JMjULvcwjgivMXu/ju0ZSyDBB+re21YR
	6659w1oq1cg029MJ4tuoZw2eqYsfboruo6vDXQZGixLZEbnK9Bf2Z0AZN6jTVnQzDriGv8qXQjJ
	JkxhDGJAAf5GUwE3kJcTjjg3MPwrGrfQnu/I4k0PJ1i6GDHq5EFdVHFZfegRLnZTQrXqVY2YLWq
	II8TxRVOM6/jKNJeZApJG0TSFHFnFDwjkhpNF5yYBvQ2LdQE+Hg6mtsOZ5ZU5DYIZEtQLr0vrJB
	yqS3ZCRKqNATl6g0FiBSTaz1xdbV3XLT3de4LG92NzaSapM8J0U1rc7GPtRBm32ABcEPbQbUwo7
	cABf44tLlvBBYn52jnmBaSG+rmsRk4PFvejVrC15LINlRiy04MASmhqCTYBcYbAT2VoNScfPrEU
	UXLQWTpxlzKNo2vtkxuNug2PpgK+mMtecfbxBBGi38fytsHAlqT9M+MUCLYDwgzqtG9Tw33XR5/
	vNp9LeCS7YZB8O4pVL1PWpn8Cy+S96aQcb114htdhjKRP4edj8BH8IghW1apJ3PogelrczSPphO
	+95XRKefU9hByzNgDHj8ZuWbUXicl67XiRaS1yZS+zxnqUcnhZCJa6SafI5ULagv+FDrKLMG
X-Received: by 2002:a05:7300:f0ce:b0:366:846a:e21d with SMTP id 5a478bee46e88-369e84d35c0mr1484016eec.33.1792809159135;
        Fri, 23 Oct 2026 19:32:39 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm3958542eec.23.2026.10.23.19.32.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 19:32:38 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH 1/2] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat, 24 Oct 2026 11:32:31 +0900
Message-ID: <20261024023232.84448-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024023232.84448-1-mynameisjune111@gmail.com>
References: <20261024023232.84448-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in the following patch.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
