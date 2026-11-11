Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355600;
	b=o3JXwGCPPGZVfP1oyAFlCG2F002bY+7OnOsrDEAF/AmS7Xhq7zIwVGjoVZUipdiEw2Sa
	 ho/wmJ6LEDIMHP8JqpzvQBJuP3K49IY9odgJd4+C9e9Xk2K0Dj6xOdl0aTN9F/qBSf7Fv
	 dx8vvvSgYCJLbl7PAI0WvbOb8g9zOoKeWPdkXizc1/rh0UOG0u+w0+Td2PW39uFYbfGES
	 VrvC7UirgXZ153r/9jHiwdP3bP7gT0VMGsKg0VvCCd9Lr6MxF/bWLZIVAWSE0ueLP4QhD
	 I1hU++cmvsiLx7XIQ1RD3aLatI+nh4Co4n0XN/7dR4hGJakfAX3lsw9jrukxG2eSAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=TeYH3PvnhrK6r1pj5E59gMXHMxHGBqidENoqpqtO4Y5ZPRzY5Zz7wAWmmri3FI+ZWfXO
	 HXHxGHn+ptbI6Q+tmCqobP9NYQtk54PQUIw/3vOmJH25U1scpuPhiQDUeb0Kn6QFqyB/G
	 cCSVWb9ah9cYUBzB26LqOwzhNyNJor39ESgPvImBB/P/bjxHQ/7gcXJOpWLOAHawdigFe
	 V+3weE/Tial3BXA3UywdUGgSz6zn31n0+PQOKj/TN2BBC9kMW255WeGHy33p7QXN0nuGQ
	 vf8Z4FllN3r3giuzTDYCBnGGAyh6FndAfkOBGo1dV0v1FHHbuYb6yjlNRWHBUFvm7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sdWHdi/B";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1260A6F4E
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E1260A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdWHdi/B
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1559380a91.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355599; x=1794960399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=sdWHdi/BDb320Xf9zcow7XYiM8pDXzFkLV3hBsrBsEfCQjIB/xcMQoUpdHDQWUdzlm
         dS81UlFA8iTZQdDTzxGwvpfdWlx3aAuLSVucGyPrEN+2bskQTyRUUHpaub1O97OojkOb
         U4LMM8Yl+ZWjWg7jD/3zb/z5PWWhZI2tXKWiY+nGA/pUTDWPyR6ydWYrdOOcBqOL3obv
         uT6GJzuh8sYhAjcmr4cNxGx9KQ7iXYrZJFNbiBbbAGK9pyo8kZKsj1SD3WSAr/jnBfMs
         II47eqJdNLExAQS9wNzsgOtT3zW2bEu/0YhSyEc78gpWUjVXE3M9JO9hw9sac0iCNY0R
         q0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355599; x=1794960399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=XhSIqnNdR1AjTLBQOCp4YiRFpp43+uzxWEiYOaTeVOhLwZn7lYy7fjhqOXHDRjQaJn
         kmmcooVYar+Ou//xwdtuHHRgcwqo+3vc/0JK6BcoUx9zqtfmd+A9aroPI4ERGuAJjuh7
         Shz3WF/cwG4YWbAiMVcIkq5VL8hDbaVVLIKhYn4imEfOqeDTZYZ0/fHWBrrdMjw3Q8WL
         DocmkunbvY+YRjta7jktc5flWH6RiLO1G3suS1/G+sTsxZ6Cf0xo0VDFEtZtbBamVHnI
         jPL0hVL+j0tHC5hySWZrLNJeZhSgKI0WmJFN+aQcCEUMOTngKSVKtjudCmyRHlxfBf8t
         QGJQ==
X-Gm-Message-State: APuU4Z+8Nwb1SDpqwtim8Hy7VRHzOZ5/L7J77u1LBRevsJIv21CLttkf
	L0trpu3aW8aQl4sf12Hu0g4J0/3p7XLhZEN5h9L3qmIcC8Y9o/JNBvc4UwlHHw==
X-Gm-Gg: AYBFou30GAI+PzN3a8iZfC3c4DNOYyBgyXUvVFfteJc3wKgol5kE3boqJfGvFaoHYF+
	Fhlwtcyn6mZFz3/rErkoj+cByBAd7cnajMn76ub+6UCxWG0kP0WAXiMJ5ChKOGk9ZD+XjfmSnwe
	pZYAXmJ/QS1pQbBGpESTQ6vkUImfLWHNlxO6YvJ+5F8rf5+5tDDR22p23Kq94a4L7FD0Zvcjb6m
	AgwGSqL058RJ7nJZBvfn6647w4FWHqCBE7d8wd4/S+tjF3J+1ltFl8WkUeHrb7955dNrHKVojSO
	6UotrcWstKdRA4VRbMAmtH5A5cv5b8kNG0BwlwvmCC9IfnyJX3ltLabCJro5AMrELk8lAqzdo4D
	vKN1tpNagjr9seWye4Tsg1JOT0hoqReEtYIRKxLJoPOhcwebZ8+b6ZtL68AiB57RJOUtsKhPiZF
	50RjpYELcNOObLUoD9oPMzA1T+bU7CiadyKJ5kwbfz3HBVQ/m7ri5uqa5swZIe9zONcKvuUL7V/
	lGhmXt+WqdemnbdaijzCN/TAq2hFc+2nF2SMJseC5pA6CKY1VX80yzV7C85uBsV0DIiUtvKOC42
	cgGMlMFtAke8DQkamfLfWzd7GW3LoBxzXF4dTSXDMDTsJojBnQTeB7j04+wXkoP9kF2dH/SPi5E
	xYTlHRYBiYclqPo+uaEg3WRcIhsTka2nZu7Q/GLc/afe2bHg/2CdnZplWUbMMR8dGPZMS
X-Received: by 2002:a17:90b:2e41:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3b182f9e1ebmr573001a91.52.1794355599623;
        Tue, 10 Nov 2026 16:06:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:39 -0800 (PST)
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
Subject: [PATCH v24 13/16] ALSA: virtio: prioritize capture period work
Date: Wed, 11 Nov 2026 09:05:40 +0900
Message-ID: <20261111000543.28550-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
 
