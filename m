Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683124582F6
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805039; cv=none; b=BilEeg1V2TIM2xG66Bh//DH3jB7q7CUfrmpCUoEPCNmNv+jVb/oYTIT62aKXFPuOG1Y6PdUPaMK/1/Qp7US0jdiKuE4kigVOCtO7nquhLuE+9Ag0MlY0I1J11QCI+cwwLP/5t7Tr9KGuHRefVsZg8rh44/tXJ5nyTUYwRBFtHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805039; c=relaxed/simple;
	bh=tVz48TX/QzASCVfF94aZlNlS6tFA4FhUdyx5cu1S7mA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0QCvlQJs2o2Ecgsbm6FYlnw5EMcW/1LXjpoIugRNZS0TfD04jtLNCq4ZxXTcigv2SqjJHu8qMOxkKVHzgJPzDAed2PwKj76m311VGbXRffEentY94tlX8UfrFYDTh+rQ6k/BOzIiVAg0i4BgPoS/+eJOCfvKL9xO6wQ+iWIoFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT9CgRpc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT9CgRpc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc61541f8cso3629705ad.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784805038; x=1785409838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EUteqNoVcwbrWDdmXjlYPqfhKzlY8VC3tktPsm9l7kE=;
        b=JT9CgRpc4OGzD72irc+Hzj6jd2dCRHeIbZCTeuuKcOjFKT/D9tlTBjy23u5Y9xls0j
         e75gVhE5FZjTEARQt2GkrZSjB+B2GSYbVoM92Qnr4PEDMCOt880RK/EQTX2JMrzGVUij
         bu4qwr3ZoklFZ8ucI3n1EYSS9tE7hbtoK1wJ5FJDrve+19Qh6+/hcLPL3LKjQFQjxr+k
         EoeyGwGkg6e65mUkTzmf9J5bI7rtmZfAPNrFkRiwP+G7HtoJed1isxDnM1lEw1ND6lg8
         kRZm2wAdOHS9exu2+H3+J+1jjXywykxkqexsPnBZE3d5H2fcHiSMaH3WvnK3L6SYL5zb
         OMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784805038; x=1785409838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUteqNoVcwbrWDdmXjlYPqfhKzlY8VC3tktPsm9l7kE=;
        b=BheW9cvrSJBMaqHLlaxYlwFG2IKIJzEyglOC1EQYA+XPSkITxhf3/91aeegoThRAK4
         GOrhHuoW9AH02Q543z+QPJvVj16hCyn5TNhsMt5WZ0khdXcfd9qS4qaceCsAt5U1URtO
         oLmk1ZQHNMXtU4sPRuSY1y7Ic66qDENKBzgnRxPg8VIJLugXZOmz5SCxiQ5ZoveSoqts
         XgJUPxr39DH1qBu92phTcyhqYlRUcyAhzCo7UiHDFdOesnR4KV8NeNxjS/txZJSU2A86
         STLvN940W4Hjts3znOUpqntK/Uqjke6bnlKocGb3Q+nYy0Gzx/mwwe2UyTqh8Owg4QTA
         VGMA==
X-Forwarded-Encrypted: i=1; AHgh+RrOQoMaF5M/z3puLBJgXaf7o9lykAIj7+217kNL5rcrvZFsnhYM01mV/iiKUPJ6+CmjLTes725tAYXyoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDNsI962Qz+Grxh0p0/BFvBBJlSh0ziiEagZ8mNLFPpUJviJs3
	rxK9BXbsaMFb+m44S9OiXYAyAAOV/y8UJc2Jt8DUCILgajaXcMEW2ZTy
X-Gm-Gg: AR+sD109SLqhCPP8WSTcPxu7ZXoofTYaOE7gAVqkaMsjepQaLVAIMsD1dAAHusNDbay
	rWzK1bCdVXWmlHrurJ2QajREoWs6wPxvIS6v5hsHycP9tnANPxkl7DNsOJpng/EL2ldlAJjEhKw
	X0x9hSWPtf69yDDp4wxS1v2F8u6K4HgirqgxTFNuXwclNFNQ1xwm90eVpwpHPqbkMTj/xJc8O+E
	AWX9rN4OsHMNzY+aUNPIqOssLlFgUDCF+XUktACNleTxjPpqxxGWvIFjMnpc195dGQc6ttJRAv6
	BS8NrVHS56SFMDzhYQKrMc6Qw7akBEHMXzxc77ry3i0P+qmQfMQsgB20n8HbXNe/4+Deuc8Nhjs
	mTgtkT2TyJ/e8bEVE8BVSZiXfy2RzGEl7n65jydp4rjPwhkUHKviQ3phtyWp8xmU4qfAMJN4SSs
	NvxXsPUyKo6+YlaZSWcEXMTwUAXzBX1WMJG2DE
X-Received: by 2002:a17:903:3b86:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cfa94566bcmr24871275ad.7.1784805037518;
        Thu, 23 Jul 2026 04:10:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f38a893sm31500805ad.77.2026.07.23.04.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:10:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: starfive: Simplify probe error handling
Date: Thu, 23 Jul 2026 18:10:10 +0700
Message-ID: <20260723111014.54071-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series cleans up the probe error paths in the StarFive ASoC
drivers by removing unnecessary goto statements and redundant error
messages.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: starfive: jh7110-pwmdac: Remove unnecessary goto
  ASoC: starfive: jh7110-pwmdac: Drop redundant error messages
  ASoC: starfive: jh7110_tdm: Remove unnecessary goto
  ASoC: starfive: jh7110_tdm: Drop redundant error messages

 sound/soc/starfive/jh7110_pwmdac.c | 15 ++++++---------
 sound/soc/starfive/jh7110_tdm.c    | 27 ++++++++-------------------
 2 files changed, 14 insertions(+), 28 deletions(-)

-- 
2.43.0

