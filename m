Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260882;
	b=QJnkEAquw6Dnf3yUG31ZT8l+IKLabjj6NATud4x+iBgI1oAfWVcfXywih4ksBguqaRcQ
	 CPdH7IY1s/ys+b+PS/PGriodIL5BmZ+WwVbpmEWt4FgqUC7J6r93vIMK0rauE4jG7ijkX
	 L8gTuLVA8RoflFgRnJYg4XBSy17nYdGbGz0v9bHYeo3K93ms2WeaTLkPTdejt1uobktv8
	 GK0ARop+siSjVIcyULiaFLurXjiY7v9BLIC47n8aCH7ejzK7/ZqdqubpaeFPFXnCDpe7d
	 5qMPYL1sLk+nnVje+qKJ/jwWtlzZ3ZVyl41jJ3eOxLSic7pgK10n5cMlsuD1sPnBj/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fmCkT2dDJS7PEu2WSf4TIeZW/Ul2nvJCI1F+qx+k+nc=;
	b=uRUkTlrUYq4ES51YM1+V8swY737CJohajS2l9hBYtDJra6Yrdwv32obXb7hCnKtqpN9y
	 S4NOBJ18D8QYgN+1iFLQqGuvSP7tJvao8wEMI053eKsbfZgayvnpnf5/2guUFxUFt+z9x
	 e4C2iL9iaRHjzwfGAZm6I+yXREHGNJj6vP6n6jhE55xSCV9sevactzgWrGlqxEkZ/a83a
	 EWFftEopp3oMtHmt9a2QB6nq7rUHxaVQ+Nx40KTXxxr21tvp0TkLb9Aw6Wlk6Kq0tdV0k
	 6JPcaPsqKcsnR4tISzJssxC3CVFCY74GMcFT60nLH9G8gc1+SKS7Zukj96th4E0K9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBjF5Csz;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDAA606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBjF5Csz
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso844083a12.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260882; x=1793865682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmCkT2dDJS7PEu2WSf4TIeZW/Ul2nvJCI1F+qx+k+nc=;
        b=cBjF5CszmWRXbpvtG7vbWvhDWrbRo014YxGmU9dZ6gwHVI65SP6owcCpKGMi2vTSxP
         ajr3FN24/h61HS+on4vVC3PToPL51UzJXyQmc0jgVjtzOJ6fk8H9O+AHa/JCGbLHDmR0
         TT1e1ZZr0lw1QRu3+t29FM1+XMIg+gspLg5NHxKQOc1/45sPE/7YXThAlpCl/WfjipkJ
         NkPg9BSD8U185av/shGLSvnl9VZ/O70VqPJC6yl13dvhhi5+Bpk0zsSOtlxq4mmm498l
         8/YTqOHCtZs5JxNYA7EZ96LFIHVVsDQ2hqJV/rbDbgpyRQjVIl2KvwsvanCgsn7MJ9Je
         VFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260882; x=1793865682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmCkT2dDJS7PEu2WSf4TIeZW/Ul2nvJCI1F+qx+k+nc=;
        b=Dn0BRAsNmpb0pNPsnPypzNOYekTb0+cURtlLrTAK7oKaSNxNQ9wEoI6X7z/eMgGnRC
         OVtr4KCMeFJKunpIT4gVPyBOVJN32wGjhDJmqkwm0qJjV4GDD6YaLVjIysL9x/wi5jrK
         E6ASX7qU+HqjKzisfz8oWc+eteBl8QprvwKsQ1pyYDCNvOGpLVXujaxp+fbNfU0w8hCH
         1WF1bxkkcP+N6Uu+i75ytm/AovJUD9iHn0io2eiQdqSbY8FyjIHVH6y2qN0oTHloEL+X
         LnM5WPJyeo46s2wTre+SgzsvsPhJ18uYkfEmiP7aGHkUxbFqosseEoCjng1xR7eigOZy
         Xm4g==
X-Forwarded-Encrypted: i=1; AKwUvBzTrl29QKNHaJJ1FvAdNW7onsRP0jcTMQg0z3l74FTzxNgrBlPNpkWwShpEyMFsinvGQvo9qXlQVfZ4WQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKByDSO9rm9DvlaHl+tJ+jipdOQyK5mhvuCYmA9VQ3UCUOvLWxb
	LHdPDeH5b55zx7g3sBIQKriDOSnQUDmz32Xp1wyPUPeMIOrWp4SNnFOO
X-Gm-Gg: AYBFou1+yKwk3lcFTKoLPd3pc3fBkwgmpivNttZjvk2mPoviF87E6sMpulIQ88PIoWA
	8D8X3+UDbkJEUqItU5+oLJE1IxiDX9g8X1Nk2rjT5fpsQ8CGslIgDk2CiKw5P8s9KAzFGvn26hv
	PZku13VvRvtT/XFWwvFpfKrXX5QX2PynWQm/lOcZX45Bam/nHVjU5C0G/ONc9m+FXYY56I+68ly
	yG43bErkbEdyS/uNtoKuIF6mAD3FsSDdZILrQ3WMaJmBm+07/0KyU3AgeHf1eSVqBJq/fFlooQM
	k2A9XNO/D5qLCnDLvAiX94E+brv5HjU+NW8DpYnTnQgDzwb89jHxljVTWgBcpbT0VB4sAJxuQ4K
	J4lBj9FSWu+++UntTN6u4ZNutTPvzADyqKkvPzPOD6SHELGMwY/qRQI+RFuM3Cll9bDPPivmI/0
	YLfN0yStpqaf/gGJswmiRmH5RnVZl0i+R5WK5m+r4d3OCwTa7ETzK+n6I8pjxnSBbFPz9HLNaZi
	fqKuKqxk52BqmD7F9oM1h6O4+vpcQxk4GG272OYvFdtRXWGQx4IFlhkmJ8MSN7tEwTpw3+u7flW
	c5vjePscYORJAOup+k4cEqogIuv1kyXVgLgVFwWASgJKYyrgTnNaDow65LHtTtRnCDV85iylZxW
	hlM/C6kMh0ytjQN31MnCwjYiUQc9jqPIL1ukFC2jiQj0d
X-Received: by 2002:a17:90b:4cd2:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3ae57f96d53mr3261282a91.9.1793260881559;
        Thu, 29 Oct 2026 01:01:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe923sm3380289a91.8.2026.10.29.01.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:01:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: hisilicon: Clean up hi6210-i2s
Date: Thu, 29 Oct 2026 15:01:07 +0700
Message-ID: <20261029080109.12240-1-phucduc.bui@gmail.com>
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

This series cleans up bit handling and clock cleanup in the
HiSilicon I2S driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: hisilicon: Remove redundant bit clearing
  ASoC: hisilicon: Disable clocks in reverse order

 sound/soc/hisilicon/hi6210-i2s.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0

