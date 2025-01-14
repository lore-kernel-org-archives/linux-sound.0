Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC71FAC34;
	Tue, 14 Jan 2025 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736880230; cv=none; b=LmzIJSrKvoScvQ9uZXhE+Z/bIJ1S2O4+ZDcUOxMzM4ZlUSAwNVJHpdiAMI6qNwhn1BY71376EqFwkPW1ZhGtfVSsOheKzTWwSBetDEqLhcTruB5wSziSIZwLuTPhJJ0/5EK+dUxwoIPJ3IODYMnjjYRmzqsbk2VxtK1CcsXKtRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736880230; c=relaxed/simple;
	bh=DmyFXt/ikgADl3WfVYugxtIndRKrJb7W0AY68gK/ay4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m7WvQsuqWDENTtfG4VMf6zO/rCvJGs1+0fYC7vaV9cRMNYN57DPz7wxwQaE9zNLkH0PQuLqWycd52G5/33Uu/7/j6aDaik+3i7ayvKKFOJyr+DYpUbnXDnWduwOozEBbsIxeCl+PXoKfL9v6gMJ1Q0NS+xU/OaJJ8ARaci2XZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2U/SJb0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2U/SJb0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385deda28b3so3268784f8f.0;
        Tue, 14 Jan 2025 10:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736880227; x=1737485027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NzFkrJv8nUokMsyqnH91gXcjIjgATSq7W6Z5A7/lXI=;
        b=J2U/SJb0TvxYBXN0BpQt2VB1+fxQMA1BWAUpqVr3TESUoyzvLsAsVXSct8qFazXeeh
         rGXuN7Lr1PO6bKQATj0uXY/SQUD3PC4tIHuKZEzFxONn5IcIqkvo1+CGrodhL3OrOnjx
         IF1sFy+N2rBXj6XnkEcElnvgUUM/FPu5cBWlKsfki5r1o1VbP3jxidTU3H0cnXLafBff
         mh4LiVXxozbVs5oWVrUSk2+/EJy9D/Hg+cJv8IPqccN80PS3ZkHbewQDDsTxFAUH+b3h
         No96WkZrV1sl3vv4tQoStl6+K7OiOO2AkzT8NoS8gDAmh/22abgbybH1C3zUXnrVEKat
         fDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736880227; x=1737485027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NzFkrJv8nUokMsyqnH91gXcjIjgATSq7W6Z5A7/lXI=;
        b=kS7uxe6BrTFbN0GA177hUzM0K+INXlwiDl90BzzCsNe5/bKuzLqFNBlYD3Oyti3CD5
         UCbnrh2jNrLlaBnKwSrQ9ITs9bwxiT+73wu0hoZMTGO913pTid5X+3Wyj6JXEjtMOrye
         3vigU1OXgirDVTYvOUEBd/YH2tBhJtRrRWJgDH8Xy2taiyxN4q3nMUqmMNEANMLMFXUb
         gl+lpHkxmi7v/rTr98UPGDm6qQIPZsJ7wSSaI6ftgc+iNKSeSK0ddJIQdmwHbUKDSITA
         OHhzKH13yKYmV2uEWKPqK9BJauxapd06YWO0BYIoav6wWFZHB316fT+hANP6ZlaVXZzW
         K//Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRAli7uynwZLBTyy65nn+PfipK+3zOuZ4V+h3KMpfO/E4J55MRGqeE/ESqcOsRtUswww65/ef3c/D3sz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+IXQlagHM5IQKMso6XOmSdtDNyzwxup9AC4rmHfNEIBjthExd
	1BaqW41JRxT6B6/QJUEtUUawZeT49ZW/0+2MlqE1hi0EDztVTH4K
X-Gm-Gg: ASbGnctwnDEaIFTKcO5ZLZgL4ePxy5o/VfrJ3BHJF6KSV1O8YI1cpotXuFN7ZIpGjO2
	4GF8JYH/NirxqwLKntIJ3CnROGs1o9iP3mFAVfkgDUIiYgjck3B2GPs59Ydt7BZNUhFjTeiDkWv
	y+YsgLq8CU0/s8dOSRzfi4pL9b282PyffqMUgRsi0OuklkQ9KCrDbYE15epHocgrUiWHE30ucW/
	LnAHaSZF0B/l21uKvYmQHksWMTmtk11WZqw1VoSATlpg7XETIuaHUGEZpr7HeMBgHw0ceasb96k
	QHuQtubG+UgwA2m49hs=
X-Google-Smtp-Source: AGHT+IHa11KjvU+MGRKlWmUN9sqBMJc+51R3zTt0acnNJO/OnLtO84yghqIXT5T+PZtNdQlkrItWxg==
X-Received: by 2002:a05:6000:4612:b0:385:dedb:a148 with SMTP id ffacd0b85a97d-38a8732c728mr23331973f8f.46.1736880227138;
        Tue, 14 Jan 2025 10:43:47 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc67sm186421205e9.8.2025.01.14.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:43:46 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] fix priv->dai_props indexing
Date: Tue, 14 Jan 2025 13:43:13 -0500
Message-Id: <20250114184314.3583-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Fix priv->dai_props indexing in simple-card-utils.c by introducing
a new macro: runtime_simple_priv_to_props() that can be used when
dealing with PCM runtime data as rtd->id may be invalid.

Changes since RFC:
- added comment that should help clarify when the new macro
 should be used
- Link to RFC: https://lore.kernel.org/lkml/20241220151213.2462-1-laurentiumihalcea111@gmail.com/

Laurentiu Mihalcea (1):
  ASoC: simple-card-utils: fix priv->dai_props indexing

 include/sound/simple_card_utils.h     |  7 +++++++
 sound/soc/generic/simple-card-utils.c | 10 +++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.34.1

