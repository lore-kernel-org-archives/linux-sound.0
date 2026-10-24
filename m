Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842098;
	b=3Wiz97n8ds6iPpmKfocXBQTjvUZQV95VWQnAxsdp91AigDBhQupQnU2TYAJItZxY2U/4
	 B+NPlUX3maPs1bDeLS6nJwOJqNyPxU1t8scxaMotmWqMZ9ovBp3KhzYrd8pr8G+s8vmwd
	 nDDc/57vwpR4Pds/FXVrAlTgRcqBNg5myR2PdhVrFUMbGBTf6yhwNk9pYnte/YJ+USTjH
	 9yvwjyY3IgozmN2JVruDukU8pEFT0mzfZGCIFUFEjKefT4X3srbEgsECQgRoQyBjcSPqx
	 mAMRru5eiLlmqASvvfNRSXbb+4vLJS2xI6kexx59LP2dF/0c6qFFzdnUgjmuanxYuzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oaXlRZ3005IxCEEktQJCWA32kAoA5lLFSgsDAh94r6c=;
	b=HDV/cqD9qmjbFhEdl3v/0mGHmPAQiKl7jIDtejASKvWwcFVCKTZFwVTmZVetOnt67f2c
	 Zc7mQFQ/9pscpoS6a3to3Liv/mUuTZZMFw5OnhB3xsF9dK7kU48F/Gr/iA1/TgQCyjros
	 s40cB4RH0VoYR1mQrjfqASmYBujEkbZvKvIC1pi8TlZYDmu0A3u4WUGrVFbnE3cFCr/fz
	 gzdUGWbkBnEDkEM70uqw5XFKz40V8hTtnXOsjXstKf+PF+5Ad9uvzoT5YQhFgigkTrojS
	 3jLMJJ/8H3OzRc/YcT+WnF7yjImfNb3PkNprqMxpYiL2emN9hpFyBFeylsKiZHkhYJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VWiK2ltA;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BAA606A323
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 11:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3BAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VWiK2ltA
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e940d5d2beso6314895ad.0
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842097; x=1793446897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaXlRZ3005IxCEEktQJCWA32kAoA5lLFSgsDAh94r6c=;
        b=VWiK2ltAXWjzIoVNTKVOvSh+4b/eE/bP2KfDqg8Z2Wc4dpLlXwWm59oPj+FB8oHuw4
         3sCg7YNkAzYFKZUZNbLqLmIRhA5qkWmY/RRgPTZa++6Jn2CE9UXs8vV8FkPpaQ4BDTNT
         +ZSbSfOKCDCjDvSjvjUNZgis0C2fz5FYJ6DIXK9n5fBdYOgQ19RLUa6OIww+wYdACrZc
         smNRh+lTrVQY4vD8o/RW0QDL70WN6ZKHH7AdbCGMzxz7ULJEkZd174Zm25LHDHrFVful
         JTnkGAMYc3juzLuwJZYr2aBa7pnabCjgNND7v6FprvtArU3UlpS3HqRcatZauXo/NDPi
         Xjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842097; x=1793446897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaXlRZ3005IxCEEktQJCWA32kAoA5lLFSgsDAh94r6c=;
        b=jfRs1hfAAwpQ7FZlalAQLmeNHmQClpGKAmhsncs5hJ8iSChUKGT2pDUXZ238spfnba
         EqU3S7wGE25PYmc59z4LYem41D7U7JjdTZ45lLCfx6U+fqBuBRZID8Il0xbuHCFMvLr/
         tJWHvzi4cDF+jOP9ntpt/YbfE0Gf13ow4yRkbNtv70FTVDOzAywf9t7gp4zjBTJK6fEQ
         EbOGqLFs352QBimB6Yj1D4S3Dl6Va5gQ5Z5Hp87vhSazV54O7zKIbZtgm4okYV979C9X
         XUslZQaMlj8p0XPZMI4lcrkuH67RgyDbyIcRO6q2HGZQ23n1HcMpwE3PxXGl016juhJA
         zvdw==
X-Gm-Message-State: AFq9FYIJ4vhOMt8mF6TxGfFs/5ziMp6fu7PxSEInRjx68aY3lyqCSeCZ
	se5+U+LHUy9044BDZ+42JqNib/UvUZ74Tc3QhHv/a+elZ/ZVOc+VFzXS
X-Gm-Gg: AYBFou2miPCH86BGAmriQTr1my4tdQjDLmO/WiAEASsAvof6i5fwdlFw3xIGMvUvMcf
	JfOuZ+AEEhBSVc7icZ6tjpmhkCdkEkBkVVwN+NcXTNe6EGu1l/FJHzxvfu44ETjqOHbAWncucfW
	yGjg1RPF3ktD6r+Kdqfin57OKZsgJXwzoLWiQDiZ1e7n9FGxqFyPFcqQwbEkHNVo0//ZVmdTiA9
	M6LBv2sdAtXIazN63xcb+cK2CLhQKagB1C3jtvi+sFXZ9FTSp9bRzyetDB9vhEocmkTqdoZsUy3
	5YY1PNBq8IHUjFtlnk/VsKKeHyFntKW/41KoyrPbamslOFuFMGF6VQLroYOWORx2AqHy9rOLqf4
	SZR+GuDx6bucKCOqDL9m+Ppw1DN0YdQw8/AuSFptIRBK7/8wn3mjVULDqmvERBV0VrJ6MbkX6Ir
	Nmc0oB1xbgYh+Cs5Q6c+46hRvvZ4bCLD9iogtDLOTcPX+j1LG7ivngji4JFupyKkCmu46GeBOD+
	7re6T2Kf6HsXpMlWUSjoXwds7uzeYGBif6dw+Ri58ATv1a/5fA=
X-Received: by 2002:a17:903:26c4:b0:2df:8d6a:3548 with SMTP id d9443c01a7336-2ea9c8cbaa0mr13138145ad.48.1792842096870;
        Sat, 24 Oct 2026 04:41:36 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c774sm4738515ad.38.2026.10.24.04.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:41:36 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 3/3] ALSA: hda: Drain PCM users before cleaning up a failed codec probe
Date: Sat, 24 Oct 2026 19:41:16 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
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

A late codec probe on a registered card calls snd_card_register() after
building its PCMs. Some components can be registered and opened before
a later component registration fails. The error path then invokes the
driver's remove callback and frees the codec's PCM resources without
waiting for those users, unlike normal codec removal:

  Late HDA codec probe                  Native PCM user
  --------------------                  ---------------
  snd_card_register()
    register PCM A
                                        open PCM A
                                        driver takes codec PCM reference
    register PCM B fails
  driver->ops->remove()
  cleanup_for_unbind()
    codec_release_pcms()
                                        use PCM or enter driver close

Disconnect the codec's PCMs and wait for codec PCM references before
calling driver->ops->remove() on the error path. Disconnection drops
the construction references and blocks new driver opens; existing
users can finish while codec-specific state is still alive.

The PCM core's lookup reference and disconnection gate cover pending
openers which have not entered the driver. Waiting here additionally
covers users which already acquired the codec's own usage reference.
The later cleanup disconnection remains harmless because each PCM's
disconnected flag prevents dropping its construction reference twice.

Fixes: bcd96557bd0a ("ALSA: hda - Build PCMs and controls at codec driver probe")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/hda/common/bind.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index 957feace0f58..3c249d70ac1c 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -145,6 +145,9 @@ static int hda_codec_driver_probe(struct device *dev)
  error_module:
 	snd_hdac_device_disable_unsol(&codec->core);
 	cancel_delayed_work_sync(&codec->jackpoll_work);
+	/* A late probe can already have published working PCM components. */
+	snd_hda_codec_disconnect_pcms(codec);
+	snd_refcount_sync(&codec->pcm_ref);
 	if (probed && driver->ops->remove)
 		driver->ops->remove(codec);
  error_module_put:
-- 
2.43.0

