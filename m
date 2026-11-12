Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461741;
	b=YGcN8GYE/ryNbKftrY7NppYkV9Dh5BTkqkkGhF20ptbR8yNWlECYyOkyn0a1zaUtdgC+
	 MBX19WmPfv4m1ba3Db4c9tQAcynugdzGJrGipsOuyo6lOkKnty/pG5qeVE5HImJP+EPVU
	 86xEq59OA/EA3OzbTMmothEIX7WjoWF9GfcUZFYA+BCgYWJ2IoJ7LNZuvxAYYkwKWUOqC
	 9uuQ3awkv3RZqAPnCdROK7q7rNoKjrH1Kbjit6hdBAAWoX9GoRynhu9nSx58Ut+qfJoVx
	 cktCoIOhNybfUWIOgtvZ26Ce750VCcrKhckVQz5blrlg/LEc6ukCQJMBFN9Dv0G0Ruw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=NCmq2J64HbDJMXt76VYltoE4hNXWi2lLQlD9Gh9ulBFx76dWXT8IdVVFO0rRRWsZmqW6
	 Rhjx6od/2DU80n2JEndSwicoyPz8K8Z9kQavsWZftLCaBGepzGWU+0BHBdu6z3jNvqKpo
	 iPOiPBtucwFo7KTIROPIMHtAejM/WW1J3EMr1K3D4HoN7cm9R3swSHKQkAeLC4TvI630a
	 9fk0DezXyepeEmkg1INAwhC8ZAO/9zMjclN4dO7zcjnR19XnXc7r0Ds2B3CzQdhEzOJGr
	 D4A/Yn2NXz3+jHlwwgr86QZM5jQcn7NRuTvMhynYuFr0dG/OuqucMrrUuakDq5LEGug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyQax+fQ;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5B60A383E
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA5B60A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyQax+fQ
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so6474769c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461740; x=1795066540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=xyQax+fQOJnP9PcUgV7TweZR+NQ1LTxbH9Jk6V4hTaYIsxHg7amwm+QOcYew3gn1gN
         WqoyJqqQoCsh0McpRL/K/ZjI5FqunaH7jg2VXe8QUbN5pgT54rk4eewYMMmT4TZi90No
         b6iEQseCC6iFkj1ebcI3E1I61PZl1++DgwaEveBV17JvL+vqfMJoykhctIZGHjPtQtlP
         5EHKtl978/RkybW4lMs15UPREN48GCHQsNz6uZqvm+9IOa04sFtCr2Wqg8visqsw9uXY
         mjIaPQo/HB6WIjiTqz7IrLWucySGLLe9aefd8WBMQ8aDH7TOJ2ddmJ+AaWlTwwMh6eJP
         jpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461740; x=1795066540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=Uhm29JCcV+Z83GIIZ6uqHfAltu2ZoeVJ4dHcOTAWB13JdEKXE1otK0FNxOetqj3dZv
         BoKLRUWQsFujhLN7TdwWVXeLcwEB88BTjgt77h5uIjTLtyo7VZDmhxmj8Bdvjwrl/aiW
         j3tb1W2mMIcs5zGtNLV+Vz1F5w7INk7pcSMwXDJQuXTUwRKzYhZi40+sYugLUwk8rJZB
         jXo8EgVHxt7ANpCiu1l5cQGdaD1jhnLvbVd3j+ur0YlhC/IPuJePBJFyFL9XFo+kIMBg
         NwHVNqBY2WJrmca8+OB6wOGP6cmL1rzyEm+rGabKbX2Ll/48qSvbbgyDK/r8tj318Scr
         TaNA==
X-Gm-Message-State: APuU4Z/oPf3RP76WZfOBLl4kfJ3IIAw/jb2orHR8jTYn5S2ny5Tw8WZB
	ZJLkgujYT+Kj++xVqFBhFfLIqXvQ+48CX+L3mwDsRTQGgSOQ2fvCebVN6oIJmw==
X-Gm-Gg: AYBFou2GinMDt5McQuJCKnEbn5WuF6Lo3sJG1nqPNXB4ek6MXxDPqqyg9sQbZ/IePHM
	JESeBy7LpuinCKlDtnlV9pyPf1mjjerK0egcqRvabjR2+TSQ5nr8tsmzfbKONnlhck8iyTHfb4p
	R0NrbundBB226+Et15ZC19P6jprKBHDtkZpAYPPFdgZWkBni8rkPj0IsH474C7tm1P6K0+B6tjv
	8032Q4BhyI//RfT9iGry8G/i/9e0HyxgIPTHjz1HM7sp9uXT+RdlmlaoYZCAuJdCMgzgIUe1Ebv
	Qx9DPM9t5HbCP2FRDzm/2vd21/59GqhpJ6okKBOXXFB6DqdLVXjd/y8w2mAjjZ+dXvei/jQM5J6
	ou1C/iEt3NwksUA+BJl3O7acXoqWYRzL+ERPCrpuUqLCNSWrKSydfud6p+hDnjpjRKn4TjaGkA7
	huzMEXNLycixF8TF4Nbg7YqDgkRqtUzPTMAZXwnyRkoYk4ttrSd0s2pj3GLsKYrO9qwfa41Tpz5
	q++HnMkvH5DOnKixgjbjPYiqYhm2tpY6gxSsdd6lTvp+I8U2aatiePXnZ0zkhstQbMZZKrmMlYG
	yfYEvqHiXrW+gWsezc1Jm0bszq+ro707+HEkDKl8wkEVQKoF7wSdh7BREng5uUV45wcXHny8KH+
	OAJUOHW0dKQUQeyMFMsjWg+tVdqqFyaOUKDzvObuECbCMVHw=
X-Received: by 2002:a05:7023:a4c:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1b3c03767b7mr4301004c88.46.1794461740120;
        Wed, 11 Nov 2026 21:35:40 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:39 -0800 (PST)
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
Subject: [PATCH v29 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 14:34:42 +0900
Message-ID: <20261112053446.73504-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
