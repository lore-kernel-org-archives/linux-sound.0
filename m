Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444477;
	b=T1bMLmEzkzctZgll5POrSVZ9VHpU1v9WMySB0b0kIMC5hi0iAGKHxYMi3fMXBd3KU8J+
	 VUbD1Jh2nxdE2rDz6badeVsYgpI/bD38LeDNnaHxG4dM90CbTLCiRp3OTmFOd90A/gBxE
	 +AzOD8EuS3DK+DhBGxoo83fYhMd8TKZM4JOOROZ6j9MrGRWsy3pzazWxX5zsc4vMAZ1dL
	 qT1V45+xUVCnSd4bxEglMp0GrRNM3sujFT/HY24ghEDaCv2zmQ27qDfvfXF/cZdDVdwqA
	 Y4dGW7R/PYakscM+lkWlCeTz3DqAYekrsJRjG9vU4U4kzXZtLxaHMKCjOQNs/n0tB7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=d/Q0v1NR/Kj/z4qA6oC2yC1Ucy2IaRPEQgvfD7bCnfydODvPG2DB78xfAFH9o4rIfFWr
	 nvsSS+hyCwTbB5HsI7ECdrg51tVOgBKBC/Rpe+dvel091MwJyeRAbN91HqXpl+NZ/skmd
	 XueLdvdCXvUzvFCzqRD+wAiy717ca+I7OnveZZSnBy7IHBxDHdjnhIlLgl1LJuxPYeSCl
	 togt/8xnww458vUfqQYBxoajNVj82VZfrClDgV3eV0SyQVLFbAnODVWtclBDwNNlDLPEY
	 dl753YEixuwv/AUq8ghMp3uAXCegJK6PLBxusVf8U3F+B3KFqsNfDv630pICYidCQxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GO+aSC5I;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD6606BB7F
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFCD6606BB7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GO+aSC5I
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3acec6677so5592510c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444476; x=1795049276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=GO+aSC5IWFM3CXtOecisZF6xPjd4DXp+IVKKsawxKknBnAZ30LrW28XAM3bsjZPtZh
         F9VNQHbtkTwLkj7AWwFDE7xf2vlgtFD9L3gFEMDbEaQuWzVxalev675vAo0VBSbPG6eV
         PBlGwdDVWGpkO6eUXfvxpIxzKtbKVdHRUafY9GIyBtJA/T3MobHAMgGwDXEyhsw826Ky
         Z44762J1XxVejVDBjld5MmgOb9QWscJ11va3z+v58dicmhb1cIzBVb8oU+NUUuLq1LK6
         Iywb2Ea+VvpQU2NVIkttjrAM9B4yqHUZq60A+rPEvd+swRJeBRK/t09aH6sCjD0jrkB7
         cRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444476; x=1795049276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=kpbupsBC9S7s8piDUh3grMr0DJPl+qm76V7vxhdMsoxxGIGqxdjLWZxTuRBj33CvG3
         HTzYGexuji8rmriXuZBRyRSMNGA5Y7BIld/BVrk9Epa+kBcMB4+WhhfbNnyyB1AvdVeA
         rWHbhhRMc7mpkqRuzx5WFMjYla/j+SoCqnDjkpyhWWsFHYJyIYhD1AfXiWUP2y7re7H9
         6B5EkSD9hFaqfSJUQkyyYms53x1B8rY1UNot48jFMco4u1+Ek2tVpGujXh+87pbRknZ6
         OXUaSgMvSAiJNYsW2Ym4t6m81kc2DYm2aT5IyHOEwvmHWGC+RoHxAlnDK14UE6NpGijR
         vzWQ==
X-Gm-Message-State: APuU4Z8iD56N1QFej2E2M8umuS9wq3zBXAt3J9MpCyFviNU7rrt/bYlP
	ZbNdikwV4ICQ9XEkoH0uhqp7NG4vwT7OAObY6kNsfVNts/hfuiKwkHZ7f1iHIw==
X-Gm-Gg: AYBFou0HRlrcnPw/I7uHr72OmdPghrw6ywmYduSvS5bbbpFzT6kJg1cCQokvPyRwvCM
	l9yaSHa9V+1JXe2M5zFrXmKTyTlaCfKgIhDvJCdC4QG4lZcScswT5lPtEy/oi5qWbFnO3KfynG4
	5ZnN/YFx8kozqS/EVuCvyqZRZyMghDUUHmdxzpCey5mjswKX/VCxFW9M0QuaZnJ0N8nhOiTcnhm
	PtuV5cqGloiCmb7J500UJu7NuwAij992X08oJU2hTI5UuW0f9QBCTg4pA1DC7HBsTdu0Qof9yE+
	tIobo/NMgmyl/VkkqJ6fLvoGs4F7f1/e7dYScJtHtfeDE+qUafIU1k7aEpDq5O/o7kysETxUIjI
	hoFE2Niw4EQl7tcentEn2bAffEsCxYXqeA4LV25cd0oBJ/cfdt2pirIsyPugGmk0zS44WwSLfId
	Q1O8lpTnLXM4xpuEOAWVSMW17en7CuBU7e5o626OX7HWnw/f1CQKT17w3wywUnds4iVLiJRiR9R
	QrkAQ+cnax5nz3Rsst2SpOtyYGA7a8VkBIvgFmBK+olfDwTKM4LUf/7FWvnFtabYPEunRnIBvqH
	CiIRQm1Lzh3xhHJX9g4yKZYruU4QDUHzUTOBnBqtb2OHXG6E1x9K75nLeX3ZFWsx4FKbPPQa8mq
	Kq3va7ypbl2YApVP+pF63dR/69+tcYm7L+1/OMwNeAByLzls=
X-Received: by 2002:a05:701a:ca05:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b3c2154fc8mr3170842c88.20.1794444475812;
        Wed, 11 Nov 2026 16:47:55 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:55 -0800 (PST)
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
Subject: [PATCH v27 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 09:47:00 +0900
Message-ID: <20261112004704.49758-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
 
