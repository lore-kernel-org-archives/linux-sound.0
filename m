Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F4C1DFFD
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 03:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776222165; cv=none; b=k1yEzMKv/rUgI/B+Kp+akxYJbdcVk1KSS8djOABsQo2Rrz5MPBmA+Qq+IbCk1CI39uttXmxwX5S8oSGg/sPsQvlMtswpZGnwLeDk5gnBzCGc8WGL5srlSBS4AElAIFr5S9r8LEfYh7TKIcmGbbsVRPHle55n46ogwR4qZxofKeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776222165; c=relaxed/simple;
	bh=wGu2318T8SgdGwHl56qLuJi897xJfTHsmM2xIkdQ7ms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CmMbyy/olAchu+bZxiznL61HwWyva1mdCCvDkuFK8lHMgh0OowUvh8OBEL+fFZAg2u2IYeTT56eAGsUF6JIGTf/Z6i/flCepYVit8SoFKAYuQYL4NBAP2RMtfhsgSBeSPNCMUIV30BCWhB4yc9rfygYwl7dFj0b5GmwSB7qzusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vjt+YXNt; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vjt+YXNt"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76864f4e58so2001698a12.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 20:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776222163; x=1776826963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zg1+4wa3amSQtgUTjIm+n+sBa+KirD0TNa7Lt6GtPpA=;
        b=Vjt+YXNtmE/Rk8kTkWjslXgE6t4+SP0H6/1JhHQYTaqDgN0JXA8qETax1rLthCEXG/
         W5tO6JFmMS8A75qVakePN8vmDZLYdtmlxcejpnHWeYnOn/pe84qw6OYAUGD9h38ZlHDx
         0cCmZgQ96Ol01yJKWa7HQP4JY3sqNMbDvfIDqAaRh6PDvHDp3RftkHq7jyijNijCViwd
         +mRSYEIFvPVJ/udNRGEmU0IFA1/QnCKN0rKqMYrwLEkmZxJgcurmpw6nmWw/HObTamfH
         yxU2kgspZDdKtaG4cv/FARGI+eXdyWBcNhf4467hkjG4fI7oeyfGSSHBbTevxj7taLzD
         3ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776222163; x=1776826963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg1+4wa3amSQtgUTjIm+n+sBa+KirD0TNa7Lt6GtPpA=;
        b=e1ZCeQl8pzjubFjoiX5JgzJaKvvtnjPNKjM9JMPefUVFTOuVE336SGJMo/rzs/RdfZ
         np+xiDHw0AVlw2nXypJrcyamXraCBEDBNfDyiV8XEP2POwMKe7BLqYe/sQnkmwsS3ibB
         haw6gosq9z4HTA7/aXJJmY6V8rLfZi8srbwOAYJdt3I4mvn6m4nvq32iwcrLH1f2tLlP
         HsaZP7Gq6tFA7z7iVBhG4MLdN5Uges6+Hv/HFVRAX13o5DbRWHWHDdkLf74n9PEYDR1s
         aWQ1u3cJajE+qOC9KavpG/7gWnErdjOADr6tFJUF9lE7EN1y4zoKIzG2I7x7lMxGRiCO
         39WQ==
X-Gm-Message-State: AOJu0YxcDNsH0hkZqGfWjS/VUDR6Vy9pHE/eSNHY6kYe6wBEqgBbzMUl
	izlCWx21hdYB5RF/H2ftRx7GMwfu5LUWIiXBKxVUIDDnlay3Db3AQX3a
X-Gm-Gg: AeBDievlFrkURyXYBs+jBfmnAb9jyKUXqBPAHnu30y6jYg4/LYmpdYZM5RFoRdTLa3A
	6SvwxQYaHJNBRB/SoJwH8/UfWBPPl/EJlMcpCE4n8go7maOqrYQe0O4z5kkFGihQ8YQjH4wwo8l
	DZJGsdKp52hrupqEd238Sij/2MIoSVPzvnOr0DGyvD3Gy1B3T4ecL+4hCoAQkL1ad5uMo0pMkyc
	ZvdfzJVqPI0vRhX8rsIhIMG3pn4gjh0eEPANsn+2yXFCP842O0U9zmQorCXpPkX74AW2qMgSkSZ
	kbxElXVvTRFzvoeITSL1Ald6SbxiGlh6teSElJAlhTciJ3FeYQaYgursuG4OPTy4zdpUUIodTWS
	tiXNRL/i6i0RAFobITf4KPJJdPQdj+eyfrXX9Jr1UxJaWnPwHpT7dMYj7KZAaoaGOT38a6FbQ4O
	5J5ihq4chbV9w45w/IVzLfK2mH3BFlYEWVac2gTKMV1TsDmSkzeyzJZbb51at/1l++ha3oIAgh6
	CSEolqKWJee/JY=
X-Received: by 2002:a17:903:3890:b0:2b0:4579:ae6 with SMTP id d9443c01a7336-2b2d5a812b4mr192591845ad.38.1776222163342;
        Tue, 14 Apr 2026 20:02:43 -0700 (PDT)
Received: from rd-tomhsieh.jhtgroup.com (211-22-143-102.hinet-ip.hinet.net. [211.22.143.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478142565sm3954205ad.37.2026.04.14.20.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 20:02:43 -0700 (PDT)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	matteomartelli3@gmail.com,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v1 0/2] ASoC: es8311: Improve error handling and power
Date: Wed, 15 Apr 2026 11:02:50 +0800
Message-Id: <20260415030252.5547-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves the robustness of the ES8311 codec driver by
checking return values of register operations and ensuring proper
clock resource management.

The first patch checks regcache_sync() during resume.
The second patch fixes a clock reference count leak and checks
update_bits during bias level transitions.

Hsieh Hung-En (2):
  ASoC: es8311: Check regcache_sync() error in resume
  ASoC: es8311: Fix clock leak and check update_bits in set_bias_level()

 sound/soc/codecs/es8311.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.34.1

