Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932571D432D
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315438; cv=none; b=FQ2xdjhMQ0JVK7nk62izWZs1Zpj8e6GObdbwQEQ/IS2NLI3nsajh4zjNSp676xuwH9oFyeM726nqy5rec4PBVXc15cONVaFkaLzEX8Ei/x4pAW1hx81xobV3SjFvsyUEcBWtCFsyfiA0jUI24WEQv7Q9zJq4XodSeEl9huz8rfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315438; c=relaxed/simple;
	bh=6sbARxfBfEuJVeTnUW5d8y/ODt73qjsLnFvpdwSlTQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZHK6nb6Cn8D6j8EkaNtbPjfkCZWc/NyncjyhX6vF1AezDWuru0CLOYM97Bl5Gbt4PmDIf671noqawqF/KkCrXgGnhTcv4TuVI1r78k+CGnZG1oW2NvGbG5zcgCZJwQ9+qodiBKeeITjlkT0vj7e63dLYnW1TV3tY4rjgKQcDjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpE+SvXt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpE+SvXt"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf27856f9cso9397975ad.2
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315437; x=1787920237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBEhlJoNhEUfCpIMUFLTjnuolbIcay5rAFRembGkrg4=;
        b=dpE+SvXtus4fR5OMXFNie5wrkFG+3c0r3FW6yzlTeuSvp5BOuQvZnNdbqbKpXFeCrS
         u+lcChm5B/IFt8PMETO4TYdLBkhO+f7J2IGWEEcNaY2gK7StIfUyOV35QLRmhuL/1fdY
         ytuzVQ+T46u6/6pkDb6pYN8pq0T0NY42CD6OwpDh7LntPVsHBvmJ7fZVq2Dc8YnK6SiL
         gkm0AnirCDqUYbsjX8mDOKDMwOVANch+DSV9fMd1+7YsCOLuIB6nEqnjedcArId8UwNt
         ANkZoyUrvTUWaRVzSQHkOJH3sn4onHcNZsDKz/HR7o8B7RZ2l+C9u4euJuGbCLj/Rk0r
         mTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315437; x=1787920237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBEhlJoNhEUfCpIMUFLTjnuolbIcay5rAFRembGkrg4=;
        b=WTqKs0iBo1QQ8j74yo8BdPamwmPjfroVHJkOp64xc/BDjgtkd/dOQmQPWm/F2lhPjB
         TanFGxkHO36va8+H/29ZKzGeZp07kBKWZDB7nSCU/HaYGUTVradegrQPxQRbCthEHBfP
         /ZkPZlS9zvdHEGY4C9yg0cGQK6oCzbNEpJmERL+KNhwGITxxAIhNvo067fwC1cPl0TTH
         xHtx3C0Alib6SbCtRKWZ+sGQ8RD3OaJUQBFtT6ciFFoCh9xbXMatauXcizFBlFBC2sSe
         Z8AH8QvTEadhaGqV/q4UMX5v77DzSFa64buQrJ837mvtfpAb2uUEDgHRwKBBefGNS/v+
         1Ukw==
X-Forwarded-Encrypted: i=1; AHgh+RrsGE8EVDb4LT/+0tqN9r3TBrTt1Cdh/Za6Cu2j6g+0OTBKuM1vZN467+jnsuRmY7GQQGXj1pR2chTtWA==@vger.kernel.org
X-Gm-Message-State: AFuF++mAiOQf1SuNYWQV/TLRa9ZTeaB9uZwsG/EsiP1Eroayxq6+DxBo
	q1Aq8W4nB8bZdtmLdJICYaMHtr7PmsvIKkmG9cqWhvfpbd4pB6BbnPiw
X-Gm-Gg: AR+sD10Fw+NInxcHpK4Wu+/GNYq2rxlpjv2gYeZMDtAjx73+Cuvfehh7Hcm3vsEUeVS
	Yy78ptDcnbJb7LJ9UIaDMGWHFW7nF2pU115CbamjqNZ+j4gRIUANF7M4WMG24UJYO6Unik7eT/Y
	r43T0ET7RgmQAaUFcQPzdN+Y8dA+JzMGeh/oTZdcYcruEzuA87yt0ED5W2EBnvnTpu03PZOpOzW
	z6t/BAvrFNKpEU3tSArlrdpsCCNsXuPE5pXA3NwBBYBO0yo0Le1A7j+rEmE9Inh80qNzMRxannj
	9s9O3wrA0IYji3Q45ACAY6OPhe3vNYYK2b56gCV48/HIw8UfjySNv501wSFSYcj5LiO6oNvx7m9
	nu6lhzP0hxPeL7R7KkrLiUq2TkY/onn357EcyzDybQwc6pA8l4O7IFmCJ5DEUkMfI9T4CAQAack
	un3TyhUE0xq2Ag/5qb2HjnXshkswdPY7GOYWfrQepM9dPFCz2x9BUwa1VqF2r0zfNZgO5VTwaZ2
	Ik1b7jJlryBpeymBRqvZ7hnW+6rPVgy1WSVOOCK8aXvSS6Yg2DCWEvPGomEw+ZxVufIUS+pYa7I
	G9Lc
X-Received: by 2002:a17:902:f693:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2d64a9a6dadmr114013055ad.0.1787315437005;
        Fri, 21 Aug 2026 05:30:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: mt8186: Fix clock error handling
Date: Fri, 21 Aug 2026 19:30:17 +0700
Message-ID: <20260821123021.41390-1-phucduc.bui@gmail.com>
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

This series fixes clock error handling in the MT8186 AFE driver.

The current code may fail to clean up clocks that were already enabled and 
may not propagate some clock lookup errors.

I also referred to the MT8183 implementation, where the clocks are handled 
using devm_clk_get(). However, the MT8186 code currently behaves more like 
devm_clk_get_optional().

I could not find any indication that these clocks are optional, 
so I dropped patch 5 from v1. If this is confirmed, I can send the change 
as a separate patch in a later revision.

The changes were found by manual code inspection and compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260820111253.97866-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the cover letter.
 - Drop patch 5 from v1.
 - Add Fixes tags.

Best regards,
Phuc
bui duc phuc (4):
  ASoC: mediatek: mt8186: fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 103 ++++++++++++++-------
 1 file changed, 71 insertions(+), 32 deletions(-)

-- 
2.43.0

