Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260954;
	b=iuPT0w95E+oaeZOUoCXiE5G4XX6Lim8Uh+HRKmku/4/fO0r23d/khdBnMG9qSN1ZeIqM
	 n2N47Zy3KmSROwkJXKHyXWh3m1OsR7X0ms2qsQFdUXtr/g+pRNmOAiHJahNlM9xYETcIc
	 35D2BhS3mWPficPwDNgvbgWdSnzNhrK6fGQ6zJg+Jxen8QUjDg03KQQppo0EWDHhv3bk9
	 SbjqG6P1H3pi7xmtSvXc7kBCXmFWW0/Gatg6+afBJ+Al1vlkXvpWYiSiCW9OWwzv3v5EA
	 ur7UnF6Lp26/WUpKhte92pac4T5QqS6MSEvtXfKTC4cMFBd/Z7cMLpxNi2U9jIyX7OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=St2VWZiXtjKvJRuy6GbzBuRluyE1JtSs8Qqs+pKOUo8=;
	b=36HkasiXzUv1WZpyImQN5Fb7ERH6pIBCpmyefwfYK0CDR737QuHgty9BMJ4n8zGQbtFR
	 2ggQAnVD2kRZKI8Wl6p8Zp1IluYOkjPrNEDqdmbUDb0dNb+h/ey0gmX4xnsjB9outMe1c
	 BFdsrxPOa3Wve+h0DQS9cHS3ros3x/WOfrRse9sEAB74Hyqb2R3Zg0W0Nx62d121/WVGO
	 tCqtMKOTke7G1F7/UnPX0Uo5GLEuH32M67ixIv1Nj8UlRSWWUnTfSWHy66/Th1r63Du6z
	 fSa4/K/jK1RcVEbflPkrwNv80PftCR2B13fMS/fHeY4I38v36zZVMDS6omGAOo1VXeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Deg+Bpis;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074E5606A320
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074E5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Deg+Bpis
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89f85edd210so754511b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260953; x=1793865753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=St2VWZiXtjKvJRuy6GbzBuRluyE1JtSs8Qqs+pKOUo8=;
        b=Deg+BpistlKhDa3ssyrh63JbP2AhhKkJbefjG8vVLi4oMXu028EAimv/YtCOCkg10z
         AqOrxp9Ci7qRy0p9qqBtXAMcaMr3dAv0IRcaIUfd02eMY0KvvvPCWmrH98OUS8qPZPdB
         JF0k8Dea2Ty1MHCWfAYGP5u6s7X+HWTZgdecgJJL82UTSUWUgiE5x01ItSUrCQitTOhE
         stk+6205qqf7B0YDdGXm2scEd2EwyFZ1rsBQvl/5d5pFzU8XZKqTUN3QjxDciLoEGnhr
         liJmmf3huJGyLQM/enLoXo+kTqqaEWhEDos9XR3XkJGunPnwzRku052ZpE+XkTLSU04G
         RTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260953; x=1793865753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=St2VWZiXtjKvJRuy6GbzBuRluyE1JtSs8Qqs+pKOUo8=;
        b=suyBCrUXyDyez98+KRogeKN8zkUA0LNLl9mE3ICPqFEPrE25uKgwaUMMvB6kcjRp+A
         f62EZrZYgNnA8Zpn/LDL4Xb6zmdEActNb1kWK/R1v1hzIDJ6n6ZvGbbrBUzLIFoiE0vc
         OAq2udiNwanDUBRaInWVHQQDa8AJO46B2j+N1M7uAzmvFX5kRYpbNL9qVKNqQguIvIxf
         l6p7+Fl6OvJ1xDa8DhqIBZQWvlkgSrP3moR/BnEn/MjNPzF80SmTxagx5SxXn9HZL+Z6
         CuSqWQzV6YLWTKGYjlU1RhhdRNGb8eGrQBcUk/dnLoKYOaKYIcx9bqizeJhAbk0jF5ki
         n7Mg==
X-Forwarded-Encrypted: i=1; AKwUvBwnxpPQdmB5q5DwiBfdJCmIyeMsMvapHC+5X4FprMZidYihVYGqUF2nL7VCq3LzpCEZd2y/6W+28xv/OQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK843equd+g6HRQriLAcvL+n6frIa71Ylr657EVB/R4kHHIHbrG
	R70HMLSZZnCFuIgZXU1In83v/7PU0mcjrLwAEV2MlGx0JlM9tTmDz6xk
X-Gm-Gg: AYBFou2SBFKwAGbqfkyI1H2JuEXePUtyK3fsHAMOJdHmxm+fgMbuPC1fuG7K3WWdBje
	OSASWbPK3hbgnA6mPW7MpgomE3Fz9WiTA71ex5BoRx3ye/3xD8k6UqF8sGSp1PZkxn5kQ980vAU
	TxWoa5oaTvErAAGfbcNWxpurI8Cm5l44zD68SJjfjJ3hKrkqMNKqvVUzz22+mWo3Ep14/ATs2Hj
	Wj2TAooQ17RP6jbLWVFogR75JrEhZwry6YkNbGnYzTXYdOfNPeHdLOjVlgf17SyxVbIpX5M9geJ
	jby6YXrsIlzWIRtEkc4xUJDyH6oh+z7rEpkA+vikxa3giatkseJFottWXmdtyLRKHIOR1FsDnx4
	vAica31TaHk90xpfP3wxmQD8VWnVFz2Bhlevds6R4Z7MgHKLTNrqnobx/vsrDI5WJI5i/oTeL+e
	bqZt/ldh4w9I405n/TiKeBiobIFWJIVVnXqSgQlnhVGq+5kBPD3k1NobYsD0e5tX5ub7nv391ud
	JlrB8ESq2G/pTAhdlyIG5XnOJjxuzqmKfBNDHvzUn4Tpvs3dFt8WI51GCEQXjLLQUOtl5XP72Ve
	veNPc8Ip1SDoWgmj0qjVyISCJM4CWMISs1NRu0zVbjdvcbfCoUSPQtHr0KnConIqWqefOGozDfo
	5oKeJR7sN9djrS4y+KEfDxpo7PERVpVWSx1YSW/pzrd25TeK9WLxlYGOdIKW2dju8Wg==
X-Received: by 2002:a05:6a00:a243:b0:8a0:3685:23a5 with SMTP id d2e1a72fcca58-8a6e83ac137mr4080730b3a.53.1793260953206;
        Thu, 29 Oct 2026 01:02:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm5059547a12.18.2026.10.29.01.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:02:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: google: Fix bugs in Chameleon v3 I2S driver
Date: Thu, 29 Oct 2026 15:01:40 +0700
Message-ID: <20261029080143.12304-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes a frame size calculation bug, preserves IRQ error codes, 
and removes a redundant error message in the Chameleon v3 I2S driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: google: Fix frame size calculation in pointer callback
  ASoC: google: Propagate platform_get_irq() errors
  ASoC: google: Remove redundant error message

 sound/soc/google/chv3-i2s.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
2.43.0

