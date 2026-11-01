Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553705;
	b=bwXYP7E3L/FAhLHteKLGPjiROOJIKolUEkPLAU5scX7ZkjT535TWuRo5eIeiAzSunfxW
	 Nb+1Zj0LFLNXrmIJDMaeM4pzn8IOB+hAiv9pBSgOvwRt36kmFyw1UalS7gMvd8lqCP0QQ
	 nmw180vZC+c0an2BZd/Psm5Tn6kPhXclqagTIUQ/HI4fwG0s3WFk2mJaCMjczY0L4YTth
	 /BBK8o6dHhA5JmH5QJBBbuZURuALv0461aXUt0YjM45N+imTHocj9vVKDPOcjGffT9dBI
	 bhLjnpXnF3H2RAbODLa2omYB10vDqdJR6/4z8h9kHqt53wcT+um8Ghq4GVAKYOmyF5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dep8lu2jYLxzayWGyAIE4MyxxyfU/O4hROTivKHxroU=;
	b=clJ1SHOBqwCQrpCjvCGSS10kf7HumaVjiwirvEi0xrnVpvnqbnn/Eo6mJ6N5YUEQKlBU
	 sgsbXZ38BJs2p/2v6Y6lIDouFcZUNBIt/6NTgCeG2tV+grepnh9wS4sRQ+S8HLyWCrDr/
	 FS6dy03GC4S/8qrylg1eWA+BTQKviFd6SusoCk3U8wRHcTxDO88ntI5/QXnCkxTpgVhk8
	 wKCv+N8hJJ+zcEfQPbk9rk+wKR+aoYu7aFBxPGwAPAHnyy5Sus6Wawwp2CZ4poJOP7zER
	 /deyRJptjeLchkjtwqH6yXCphINYeB4p/hteSP9MuHQFAU2WMI00XoWSmPW/VQzg+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=iszBT2+n;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C47606A325
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 17:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C47606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=iszBT2+n
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8aea7b7ca0cso19096367b3.2
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553701; x=1794158501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dep8lu2jYLxzayWGyAIE4MyxxyfU/O4hROTivKHxroU=;
        b=iszBT2+ng7FqJn+05MOZ0Fqq4Lrw886pC4h1+XEPFO+LTCMR9s0YrcbqRnh4HR17p9
         or6jGJU47KgVRMC6aY21kW8vmC8481U5eQnz/Cs/3LLpvoEqJgiExQbDQg7+ewFIBAAn
         8wKpoSs4BHJPOfj/IptmRRkpRbnu7+0zg+Wtg6Dd0NXj6heTA2BKV6r7cwCA/oIVFiKA
         OUx1x8xtchQbcXB/26TjFvhpgxfw5SeJ3lX22+dbdG3D7vtOn9HyEYr7SXUuzfcjgsDz
         w0dgbuuXZQKOSw1DZZh42R3SizydNNJuDLpY8TclLeyLaScMa8hLZ8GCJJwA3WFtmd4g
         1Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553701; x=1794158501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dep8lu2jYLxzayWGyAIE4MyxxyfU/O4hROTivKHxroU=;
        b=RGDB3y/VckJwhplN67RYQNqpy+jN8Vf2w6PJcUnTSpGgQ4V30cXpMOiMQpzFKXl01q
         T2BpaiaZUDW5qOP554XfjxXVQj0etidfqkBrpo/fA9abVfH28GwNkMQpw7SC1u617BYG
         kSXSTzPuC1s9jbedi6vAfhEnEyCMjNQsKG4kKjWCuQf90xWwzx/sS9gxkQcwCaWqNjA8
         hVYmoBIjxMN36LJn3ZN4xjgc2oTDZAZooB1J/EAFYKdVoxVwhlCeiFdVjzFmKS4BapWu
         61bgWtnCLkjySEkrblnjPdiOo9hC5IRLt1qeq6rkjZUNxGS/zXVcmshN4YyFAFzVXmH6
         4Tog==
X-Gm-Message-State: APuU4Z8dLGUU5HNsUwlFAER8Amd0he6GOerc5MRI6l3y9TV1pmpHM2vd
	oXxWuJ05L9W2r6AQPzAvgAP8oOnzj2uOnkHVn9d4G9VoYigQLDdF8KMZM4Ca15QnSLxUXTqqyCS
	rp2+v/w==
X-Gm-Gg: AYBFou2Kg0TdSHWMRoE7Uimlk8JfgqTMNmKoGaICEO4rTzVgHClmAdMkknAsHiRS1xU
	kBh31sstwFAzuX3KEhOxekz5Dxj/oPpItVKVaQN1KRlW9luVL5wPYJR3dM4BtB3aTDLImTTQkyV
	xd1IWj0GNNIgjUEsHtCUWG/f0Zq5YIuzqGKVi+R7W/4k9J+FMIvaQsbsymgDirncUudv8dqtoKY
	6uvJHKCNUlanwtuiFAwUwQVno107LMLZ3OBJdQiB1HjNjIDQF1tXibsrF6j95iyE+/6bhuL5Q1L
	sN/O4OVxPgyAieHhRH1HJ5X2YHgoldHRoY1bAOfx0qeFCZkvgcIVdX6J23ZgyP+dtyDYimhEox3
	qarXvHwneHk5dlnBF2pkDO461WDIwmGSabKTL6pUbI4rB4j3qBFGm+kpvRUHNeoLSn31bNLnHXQ
	tHi4u3OBb5+vBorF638dkb1qEYHnM1EiULBMlrvQasv9fNX/ZDc9uXhvBHW2gg6+H3pSs2EB3pm
	1aRoZHzMxuwEi0cOQ0bqG7XxH5LmtPgZj3ZhqI0+kfUNFeSIQQhrRor4YJoDGcpCyfzMk4=
X-Received: by 2002:a05:690c:389:b0:8b1:447c:cf05 with SMTP id 00721157ae682-8b2b67cd1b4mr43801677b3.67.1793553700742;
        Sun, 01 Nov 2026 09:21:40 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:39 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 0/5] ALSA: Make always-successful helpers return void
Date: Mon,  2 Nov 2026 02:21:29 +0900
Message-Id: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
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

These helpers always return 0, so the error checks on their return
values never trigger. This series makes them return void and removes
the dead checks, one driver per patch.

This follows up on the earlier discussion:
https://lore.kernel.org/all/87jywvyu2q.wl-tiwai@suse.de/

Ingyu Jang (5):
  ALSA: hda: Make snd_hda_multi_out_analog_{prepare,cleanup}() return
    void
  ALSA: ice1712: Make chip_init helpers return void
  ALSA: cs4236: Make snd_cs423x_pnp_init_mpu() return void
  ALSA: vx222: Make put_xilinx_data() return void
  ALSA: ali5451: Make snd_ali_reset_5451() return void

 sound/hda/codecs/generic.c   | 22 +++++++++-------------
 sound/hda/common/codec.c     | 16 +++++++---------
 sound/hda/common/hda_local.h | 14 +++++++-------
 sound/isa/cs423x/cs4236.c    |  9 +++------
 sound/pci/ali5451/ali5451.c  | 10 +++-------
 sound/pci/ice1712/ice1712.c  | 12 +++---------
 sound/pci/ice1712/ice1724.c  | 12 +++---------
 sound/pci/vx222/vx222_ops.c  |  7 +++----
 8 files changed, 38 insertions(+), 64 deletions(-)

-- 
2.34.1

