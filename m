Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C055E40
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297050; cv=none; b=u2TQ1Fkqfh3HAc0yNgFO0E0+NmbKFkXTTn7AvQyE+waId+/G58XNYMhS5ms4OCoTsXvK7/aC24X+epje21WmRh0bhr1tVYozWMucbjHLF9BFI9vcMdQibklFvUn7RmaUjnQ2Q9M83FvH1FB+gUlslCJOdIT/GVIG/xuc6cZ9iqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297050; c=relaxed/simple;
	bh=ahR8kEn1iSkvc68bsIoq9sfnPZD0DPkdSSzc/MAqMAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fx9FFvF+OSAveMqnHQaWB4IMsmegc4PaptiN9d/q6quRFpKooBZpLBsMPOra+LaisziYytQ/Aqnmb9QV8j8dNtAHHE0RlGaawxYot/ILME1+2HhZ7zD9srKur4L7l4xRJKkjVMj27kskLYI5N3/uh+BPygCZLNlPHqtaEr5ddxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=eBVgWEVm; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="eBVgWEVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297038; x=1714901838;
	i=oswald.buddenhagen@gmx.de;
	bh=nLj1LTsyg2WOnxDMatfclK9cFBOte+FRRkY4stbJcsY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eBVgWEVm2lpxBmO/hKC0z+l9UmTYkxhnjVpdpaU8QIRc2X5kGktaEtB/TDdOlrRd
	 W0F1A8COGQK90RuW0/u6pbh4bBtwJ6iy61vXU38jBzzAhRsUuZnEHWQp6iUxI1hnP
	 +k8cuC0ob8UeCPyLN9paDKqe0TxRisQdz64sggHzbVwQyvP9mheJRwGa7km2/haH2
	 0GlmwuznvA4oHvbpR24OqiToMDjTHgCBoAP4Ft9OZXmgYFMnlyZraenDhUne/GB12
	 Kmd0t6Gj2lb44cMa/Q1/ztj6Wd5tWtHXCHxOH8IM4esOtbWHZKNQ66zDlmemPQnY3
	 kLxSww6oUubx3zOXKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0X8u-1svIt81Tcq-00vq3R; Sun, 28
 Apr 2024 11:37:18 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yD-Q8l-00; Sun, 28 Apr 2024 11:37:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 0/4] ALSA: emu10k1: more improvements related to uploading firmware to the E-MU dock
Date: Sun, 28 Apr 2024 11:37:13 +0200
Message-ID: <20240428093717.3198716-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6BFHA8AG6/RjpYu9f6xzb+kZ2ThkaemCGv7O01QoOfRbeukO7wu
 bEehRoV9dS/9c/X0dBtoUk3aoN9oPZMvOeojhQtkuUsowe5HZGBsTu/6tY2wKUfQN6eDJvi
 1DsLCABvyndK/oxiJsVAraUEgBkRCnx0mzvCweFShoP3Ai2uP5Lbb6go9TDQwjxEgxEYI4V
 hj5n1umAXtcSVyZcrGcRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:C+RyMgU36dE=;KbYfcK8QH4YlU5O02l1f9zvxdgz
 DaFRUDEo13Jy6Pdy/MyCdibfSn0ityVCJZi26ZorAuWj3H5+AGo5bhRgGa6eR6ywf6wliKSuf
 n46j5IGhdn3ny8K1Vl7BcL3GIGR4Bk1f2LaCNl1/Xt5UmpWtVvVVY+5qP12pFXPUfa+OTD1rL
 KWAP7nlQgqiTyo3StNHaq/ixXerUNjAO31ICgrKjAngkxBCUkV/EyoFakmee38/PAUroeMHgj
 rjZPkHXfReFzfNr7jDfa9/+1vQ0+jn7tcpzDpv9G9JEME7Srdk4RUimynI5PXNMILG37RD1pD
 XjNtBAE5ry5dqMnqRqBLZSRBS76EJ8yCGe7PWBaR9cY9vZLfU4vaPBxwByxBhhIjUew9pNmVS
 Yh+RKmwsC+q6qEL+Za56uYRuBxINyZ1N2qgCSW+R1xKpq3UcojxSjDwiUsx6hDgC4CHDlS+Ot
 ZlUvI2+Q3bBD0uD9rliH0D6G599ROh778rd9vedVJ0fN5OKDxQRLH9E5M9EiqTBba97MdlXTf
 qbfOG3/EMsQKkUv0khyIx2x6k0rwmh8wMXsjop4oU5ePK6aEv8IrvBGcN5Ilhfp6S2yyxqBND
 3wkMUYOCYInMA0jtXDsDxBVrX3/l/fJXGyMvvABqfSpQitZRa0DX58UgXcDkIbU6HJpSF0a2/
 ZLl4gQdXtrQiNNtulCzqBdNRtLYCIZpHE1737F8AITe7W8u0OMr1KVjvtKqrrxPPu4A/AlmGL
 uUtuHjUWivtLFl6/tFmPv3bd3rPZs+x73Z5N0QOk1oE5TDUrDjI+uO48M+Mavt6u8awG7FL8V
 N9dE6bnMrE6/aD9yqvwJ4xMD0lGFeRTiMWxqvigeUNXLQ=

---
v2:
- split off from more critical part of the series
- re-ordered two commits to reduce diff churn
---
This patch series needs to be applied on top of the patch titled "ALSA:
emu10k1: make E-MU FPGA writes potentially more reliable".

Oswald Buddenhagen (4):
  ALSA: emu10k1: simplify E-MU card FPGA reset sequence
  ALSA: emu10k1: make snd_emu1010_load_firmware_entry() void
  ALSA: emu10k1: move snd_emu1010_load_firmware_entry() to io.c
  ALSA: emu10k1: move code for entering E-MU card FPGA programming mode

 include/sound/emu10k1.h          |  1 +
 sound/pci/emu10k1/emu10k1_main.c | 75 ++------------------------------
 sound/pci/emu10k1/io.c           | 53 ++++++++++++++++++++++
 3 files changed, 57 insertions(+), 72 deletions(-)


base-commit: ed93395844979f6bf2e1fbfcda38d1718289b426
prerequisite-patch-id: 5a07270251912fd31f913bda4de46fd8321d7960
prerequisite-patch-id: 573260da563ac3c9ba18383044a52f2cb00c1096
prerequisite-patch-id: 6268ce55ab58f0cffb3a3a19cac962780731affe
prerequisite-patch-id: a7ede4bf7174c7b93861dc58125fbf7debabebd8
prerequisite-patch-id: 8572ac7b03d12a9d8ad49ffe7a599e5ad89cd267
prerequisite-patch-id: 6f08dff99ebc501ac93d7e1c28f707ade2384b12
--=20
2.44.0.701.g2cf7baacf3.dirty

