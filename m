Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88A531605
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 18:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914587; cv=none; b=LkcFaeaY8Hu2pzkeUI3ITIKnAHXKW4QsmvklwMgL/k/8XGRn6q1vYKhFq8oB1Nt2kxSSIF6zBAZpVxgHZrtOftF2916O0ABlCOYT+/NoaBOFUfokdhsukZcbUnde6f0EOcv3beJ32Hbb5shUM+7FOnawgcLtLfOugclCSv6cT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914587; c=relaxed/simple;
	bh=/W79BkBsSp1bHuxt6cr8Eqgogf071EIwealgkx2ntKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NAPcAqI4dveH+wBCCLLUO8I3VtUa98fWKAl5qG2Rh85r9RDeaiZcSZ3oPzAoK07YN9zFMBHeUnEcrHpPuNlmK0/d9TBN6DmNj2FsyzYnus5Li2LHzJCSOHj6YOG2ZBCdeRGDkrv4TdXNj2Fyxk6Ov0QSxvr9TDuuBKU+fZCnqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw6aUcur; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw6aUcur"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1702115e9.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914584; x=1792519384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qs99al4wHMjRVHpTlhI51DzzZ6O6j5pMt+HdMbt/54=;
        b=Bw6aUcur1TjeqK/AIqMjnNmZctuk0tObRajCoobP2Q0w1hdS9t6w3LQyXbC4+RqXsp
         ult8k/kSRHF2qBcrhCpswbIa3vXWe3irQlDWdicD61wcjDfjWznQdkodt84WJE4zCg4z
         dOgh50Rt8YW3DxYWjimsKTl+0pC7T4cueXnq1TT2b8Z6i4L6QBAtj5oodCakdbvVkre5
         UDz9y6qVfHfluHzaLQpk+hlFHIJsjoPqRjVIk4KHRnTm9HPZF1wwtbMfkDt46sDfXNcV
         L/b+N0gPZVO8fKY41Q7vM03UjLpXNzBx5po3/ZHh1pRNl1kbMjx5BKXM9gcDOMiPEugl
         +r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914584; x=1792519384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qs99al4wHMjRVHpTlhI51DzzZ6O6j5pMt+HdMbt/54=;
        b=TVb/oUi3EESt0mc+wl/w0DHDL4YxRq8lhJXyAdIwqQ/KfvAMBzSMByZ3OS7bZyGke4
         eHEVFtVcU+UC0ujZtlDqbkEjd8cbiXZr8hDhQb3dUMpoUAYtkl0IdtsuI5SX/R9+BKqq
         le2KrM5fJz8NmGEpvzv9UPPFyRiBmfD2941H0UxMT30fuxVRl6ChjDtZAC1VaeLEge18
         HkqxanvlqxHF/5toqU/VgF2wF370nn2qPDF1cim1Lc/rxcKdJZELID7SMA2a0HzDShcv
         xn4i/kcyQX62fKEGV4U5DDP17BAJqS+mg96C5nIRmmt/3eX2bQYJ/XUvqMFzB1bkAGdt
         IFGA==
X-Gm-Message-State: AFq9FYKLCH6G2Nx7/Uy5GuWa9R18oJtpvH53mt+wPs6qaE9JBD34JRHe
	sGQ7k0odtqm6jl0MXahi2fg2ud11PVwzpsbTVbPeuzKctNFJ8Vf9esX0
X-Gm-Gg: AYBFou2z15oUqW8rthuloEyhEOnDGlTMipkpvBRiHsHxNWK/ReSWwhSAqa4zX/GFSNh
	B0viNa20IDZWt0MHrpHx0NblKygRTsdKJoJi1yvGzha8b6z3A5tR5sc2nEwOMrLQtigCaX4Nv6K
	fb+R0LbJS3oYl4AgFRnYhYHvz6JxZV9HWt/zwygBdLHgVNoKAYE87/2+vJOwyiVcAaCeZyfoYOl
	OhBFvjr6hTboTp4gMOBApIX/ZgJszx+YsWtxuOXaKPMU5qiDg4xMayp1onwLN841XPVlaSdYCL9
	igb2M2G6hhIzunBxhM3KoTqlPzeurLWMd2JOZakDKztcdWoLFjqZLoXRmFW8CNJgUIjtmRo6fUV
	1tE6vpqncNZNEd5xoPsuZdLe6uNfVgWirYL2yh7iaHgsWjYeu8uIkJ3hs32XRC0X3LnexrcvYyJ
	9mS6gaKLGislKYAf1bx9zcfX8B+ErJbKSHAeQyBXxGyoWUBFwgy5/fZ++E0eq1QPwau6n9bRZ1S
	E0quK0/cxVnRKxXKzRvJ2L5+hWESg==
X-Received: by 2002:a05:600c:4fd5:b0:4a0:5b:7bc0 with SMTP id 5b1f17b1804b1-4a18e49a7e3mr275200515e9.21.1791914583568;
        Tue, 13 Oct 2026 11:03:03 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm6381987f8f.48.2026.10.13.11.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:03:02 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: tegra: Support auxiliary devices
Date: Tue, 13 Oct 2026 21:02:51 +0300
Message-ID: <20261013180253.477605-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for auxiliary devices, such as amplifiers, sound-muxes or dsp,
to be added to the sound card.

Svyatoslav Ryhel (2):
  ASoC: nvidia,tegra-audio-common: Document nvidia,aux-devs property
  ASoC: tegra: Support auxiliary devices

 .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml | 5 +++++
 sound/soc/tegra/tegra_asoc_machine.c                         | 4 ++++
 2 files changed, 9 insertions(+)

-- 
2.53.0

