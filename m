Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365827;
	b=XpBpE6LUwQoaZKeCFxZmfLSqFTQADZKIVk97qgSxOWgnjk8sc+hcdzhEZaXrKoElpi+p
	 efQo9gK8dkz8GPZct10e39Z3Kw+u3bjrzu1ylIGqMb459XwOugHcLBnGGynftkijDVeCh
	 3dab11Na7tdDPAcNcdw6ujSKJz0BWuqkGp3VI6RRXmk3i5SH5M/c4INjiPyaEWvhBnnX/
	 9O0YC7JOSQWbhkCKkhMqEklUnQPnobHv55A5LifoS7cg0aBzYvHdfb9XTg44JWd78yF8M
	 v20srjFyJ0vlvZxGh4nAc7rs+v1gqeayWmVQmPfjOnXmst4R41WevCPdNyzbzrgYAtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=aXDg6whI/Ug7O57rXjRUQqhgluGZZFHnIadeTSiUEvQfYx2iKzBwalcinDe7ZXrQGCoY
	 Zc5nzbka44Icqr1D3thnyZ2rG3Q4lZixZxUYmdVJObRvZgF9YHWauuNNTcf4Ou4h9Q9O6
	 frittgWYmw0aTwU8aINUAEGysq9ncoSNTxjHdUrZF3/wqZdHYC7SOO/BJm4YpmD4fQWjJ
	 SdNMfQ66iU+H4QVx5DlhkNAvfRyAmiMTe+YSnHU8SxTC+x1IeWrKpSbORoInKqhpr5gN1
	 kMWmLXfvvO1a+eY4qeDqQ9/suOPQRrO5yJN+CAhojxK/RMwBU6Gk/+MjwhIp05EqoXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tchQIMAm;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E80606A32E
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E80606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tchQIMAm
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so3047818eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365825; x=1794970625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=tchQIMAm3N4Z3rdEQUCbuUavaoAyHFkR2GxapDzoH7BNdBGZJjD360Weti8lLBEO+6
         JAlwsKExOa4JUgkCg6hjgV4Gl2Wm7WE/pjhKXK3ziDxnOIq0WTqSl1mubFhakgw55Z5f
         MAPgM5wHkxv++Cuw0x4AJN3Ar9aBo7xD6F8q+rO7Tw52YT3yIv8OzP8hIrBcffAwwyel
         f+t2h7tzvLuVaV8VsJx4XWAOsZUqGT409sNLU7CkzWM7p/kK6i256eElLd7uy0pEE73q
         xARHNw/aJb7krlxFbR9Xou1NCj+FmeOu3RqNrZdO1LFCL/czHDs8tJAkJODiRN1/bPVA
         hdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365825; x=1794970625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=q2W+ZuNckPwd6vXTypBud3Je6GiOBmzJJ6RAKzD5U1jmj/JOWeALZtEID25VNKyA5H
         ipxutnBpKtgOJ53vw5bfOL4s/e/xlSxtV0+sl+47lJ7oJ/dINbSIg0fUFC4oxet7VD4V
         elN3kg38p3yvQUoItVPAfXZKOVritMOIPeaDMeOk0qAOenYgTsz0XfSloG6N2pWS6Ets
         2TWK+TGpq7XLpHOzY70yKDVusqqaSg1VO6Jx/RpMWiBLudDnSEhxCfAPPTNmyNQrdDUM
         fAJTYRgV7Ai0TKK2peODNnKFg4NyPoLGfr05RrXNBb0kwTJgtmLD/0kNk5tRGQi0AeCg
         Fxtg==
X-Gm-Message-State: APuU4Z/660p1yuyyep8AwnAvgBxfuc4lwySVrUuvWvYE7G+Co1uNkybA
	ZO/Sbo2L9DSLK88Cfn+5MCBBPLU7QIDxRs/f79YBlhdYscK+igU7nsOVh2+Hqw==
X-Gm-Gg: AYBFou2Eedd5fxqVCo3ePULaPT8bgzaTJ7t5xdnpUGMo6GBbUC74Wy5IjpUzdfcGOAY
	SeLOMoNbfoXBZ6oBcr3YNvAbJe6k1Jqz9wpENOzji8u9KKuftyb43t1RBbdkNjTKkSPJ+c1u6z3
	51xpR7OXv8VmdF2d/GOX2lLke8zETrhXaUrRuOtGPzrcxscVnD5SvqGLC9fEzPVdaym+EcqOqZZ
	zTFfLISwh9rptzOFhioQQUamJbT/T8ohPdrQ/AbLf5iI+aRauVIrOTxLc54EtUSrcB+FKJlF3rs
	c409fHsD2FUhUJKIev9Skkd3ozz8neM48bVORcOyZV7zpCeYVAZx5GSegb+krfqVVe6jPRS0iRD
	nG6cvn0qb+iAGuSDStgQnhOsQqyF3GJo+ErXekoNqJw4WxN+W6YnG4HpC+TSYBmvWGuP1M9+NNl
	NgBF0sscPSqBdQgZzLjo8rl7t2uUiMJxktSjylA47aoFL5QcH34x0EUBtk94DerZauC3CY+u/no
	cT4C9RGHCcX/6ru9IlrkRC98jr4ata/nq3UR9L9QmZf59I3dc032vjpJc498z+UIhXbyMD4Dtn9
	hNPShPdPAqaL0uiFwcN4Nsvzm/E5q1Rft2y8KWY5bRwE2ar5PiOykkoI8U9H96XICvqGtnRuAZ5
	Tzu13m1RNCvDS9JDwWJJXBnfpC1SFr+dr7VQ03MMvoe4C6U8=
X-Received: by 2002:a05:7300:560d:b0:361:a195:c46e with SMTP id 5a478bee46e88-3766763b79emr1918799eec.1.1794365825118;
        Tue, 10 Nov 2026 18:57:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:04 -0800 (PST)
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
Subject: [PATCH v25 01/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 11 Nov 2026 11:56:40 +0900
Message-ID: <20261111025655.63951-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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
staged-capture policy sampling.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

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
