Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464742;
	b=zXAzMKN5O/Qk5bq2DXhog0bz/DHeoP0eF+Gw5zleKxW+oSVjK88eAcAhwtCd3cokDflC
	 PU6KNjPy79EiOLbnouev6rx25zh0DMPBvraokXbMZL5xr57qzeb3pDOboh5kiYt+VUniT
	 QPaZCIjBzwe0OAzBFOzGcX9Dhvb4B3hiJg55EaSKW6NLFxxHQSLdNq0Fjh8ApYnCauO4C
	 jzKCZE01cAnDOGYJQQTANv/wpHrCTJq1q/EaM30YUy0tHjFDrljqlNWhoTb2G2jfAorIv
	 wOMed9DSx9tiMYy9BnfQ7auAuXJaQwfZXss/UycIBN9oobo/YIfaGjWGChq9vcgzqrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=5RaaJ2jUXPpfZZ2xSvmby+8Iy3vRalEGV/JQizFYQQeZsQAiur1i+pVgUxn7Nz2LrOq+
	 W7ejtKz0AJw8c+QvvzAjWfssSz0n7tw5pglzhJUz0NF9JUKvPAHcwDf1W/E46LFfdGWPi
	 /7kFWN25FII1xsL9ppTOjYCX7syMk1Reen+LWXriEXUftzTQ7nH0lPQ3mZoQ/S+Tri2vq
	 nB/x9M6/5qplOHuuvdhpbdxJqXtr4dTGfIDVtubhrYfuRmJRveay6S3hkb1JEM78fCG4e
	 WCze8iHxvRq8bYVZdpPS0FpSe+oJ0ODZdENBowV9cxs1cPoiI74J8kWsAlniSzK25Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTbBGbcJ;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213C60A381C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E213C60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTbBGbcJ
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1947656a12.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464741; x=1795069541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=JTbBGbcJO/s+0la+hClvUtJHOkPAWnT7Rfbu8jLitnm8KlLxPiG/2QycBde2UwGlZz
         +qY52ev1PS8o7b5AViL4Lr1rIdWjWa6pvlHOP7Rw5/U3pDBWqQPSP6q1TItOc4ccLjX8
         8E64tW+JdSOytO/EXp9Iw/nKbDRfwDYTPvpCHD0bl6DKE/CHlqQtOOwPgxVz0DCQHLmB
         Pgubcjvcq49YPdlRc2lmvW5Iet+ShqflACQmU4FtOEuqnLsOnCIKy5e+O4sYtV+N5Een
         H9YV1fgDxqTgzmbMkCS5UqKwKGQMd0+61sbvqcvK8wPy8+ogZ2KhsNUT8klzYSc1Dd99
         E3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464741; x=1795069541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=J5Xsh+mNsjhUvvgqY1MkLUSqYg0srYJGVG/D061YOxL19ABeZGw9D7ibrodPfPZ7Df
         6cQEW94GFxU7clutmxabdCgmRUmsMz9gsFAWvC0sJTMkOzzfBA8hh3soi/pRqEylXmrz
         1gUKxv360kkgTTnbUNl2/tYqZmBPehHR/KmRdrkFuBEkaI43ZacXFP3bep1MSDeP3j6n
         UZLgpzwOC4uZPB1qTvq1xGUujOM706m6TUdJb4smetMM5/3hkpYOP+4CdYs5G/Kdtapq
         B2tGq/H81QgeEBKdKPilsIXCyWUfbybN3Se9qjzCf5JQLwT8tPh1cUOsTxfoGGrakBP2
         zxBw==
X-Gm-Message-State: APuU4Z/cs3hnWad4uxr7dsSHXFz0BDiVoBx9qJqmgdWxTHMI/qQXPXQD
	URkIbGT4EvaZXwokSvpklGzCxvZKiPWTGn3DbIF5CHgsTzZN+d9sFT9fuYGIKw==
X-Gm-Gg: AYBFou3f51EMIAsUH6fojQ+P5AXs12iShlntFiMcsPdo1Kw9a0Vy2GeecgvEtL4YNLp
	pXEMizH1b8Xj2d04G2X3l7QgdPLbXNtnbEUFmlax0ouoIHQrerVbPP8vhuMKgwgmq3J0MDOsGJq
	cu/Lnhohx1+emi597geTch0KKLHkLVM23lW3M/rR74HXayrWZxLyKnN4ldjJPcDJTv86B/s+Xfq
	wsdRuEmyHqA0YTDJHOrWzWa5wfK82PjEhQmR061BD3wtg0WAMVo+h0a3vS4V3phdF06lrnxAmA6
	OplL/xHYZcPDoFhUZ3FxhWH2/anWdC5V6jJmNd88U5cmMnh6OaWThCcyHdJUGFXQ+s06eL8IFBJ
	DiRxFVclA3jq7yNHsxJvX2x+8Im5Mc8MGKrAJDBuB4Z9xwdXgZYtsEY1oe/8zp2MamrpxkeDHJZ
	IUvVF0W6rNflG7lEATjG33eMST6oH0gk/cGIAVOfAZzzSUyHPoSkHAILTHIMmlVD1B9Hl8p/MXl
	dhXXXMDnais6ob+Db7qXCy94wpG4h/BOeAirRtP+k8a8rjiCmwb0GT1+FSkdyalLan6YV7m3q5V
	4tAxt2kn/Pv6JQH1NupJks/Eo4rO0P+YWY9Q7XlwiYl7Nd5LvbPQu3NR/5v8M886ZZ5ZZASaqtc
	HLVKsliIDzQl2OBQxEwtw/2mcIoQTTg6qmg2omK4dOFZxO0RjH9btI9P8OS7D+H6nAj+k
X-Received: by 2002:a17:90b:224c:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b182f86a71mr4580741a91.46.1794464741228;
        Wed, 11 Nov 2026 22:25:41 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:40 -0800 (PST)
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
Subject: [PATCH v30 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 15:24:42 +0900
Message-ID: <20261112062446.159-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
 
