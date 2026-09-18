Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE44FD286
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738783; cv=none; b=rLkxAf1AIzkjckInVa/VOajCDCZ+/DnGY1UiRoZ6Ld/dOQHoDFzYXCnf+gkeWdCMDrAzvL2wczQzyJ58sR9R+X68GJvrfcA/l9Bv77R/qdlbmkiRYZgZogBwXNfVwSjvwwtUznNkzJDOvXNkp95jPnWYUu7OuvfI9vmEpoEXPK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738783; c=relaxed/simple;
	bh=bfkR/qLfNTRZ34en6gQMGVqTglrIkt0mNbRGBMAZoDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaSvhb0HP6OiaRP6wiOOFWr2KSXGLF6EwSl5bn5ku0Tr0MBOQyeYq4PHK8cixr/vd4/kvmY6pKwYCMopDWAvZviCjuztX5J3DDK39Udhqx8Hyw5eSGbHeC9S5CcfRqQz5XhHYY2zj2UZ1I7nDWf9eDpmpvvkB2xqO2oL9UDlEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncc1c4U+; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncc1c4U+"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so620268a91.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738781; x=1790343581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=;
        b=Ncc1c4U+EbAqreU6nIH8KKRspB8WfBXXLN96f7oaJn6aovVbz20//ds6Ihl1smbua9
         HXHmkl3b1WBvjgSCOj8E8RVfdYp6ElV5lLB2APcws/Iec9lQlyAB5u2eO3CCnpegHDJa
         +8cI9LRBJqVnBw+7Z8OiBzBpPkL211MttYu/AcSiVO9DUHWEVUTNrmtBI9mv9llV9XNr
         hQkThPpmbDOCFEaBLYLKOe9hkh21uednPzu56h8elr/AdKLqhAxI2rPht1if/dQ+Vhya
         n04s5GDrwkZJRKHKKZ4hLFHL+ymXjAVz47fkHJfSMXXTgdDDOu8FT5tmWn7Z5bhg32vc
         DiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738781; x=1790343581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=;
        b=DGwSTbZfqOKc6yz4W66RJ2FR0WNirFg7QSNbmmJmn53g86xJUg4RAT67OWYmH7N2xb
         lZQkAL4lCR/YDovYnxekqR7VIhY9hvdUAj2/V4pJSXgZcB2TotwqHUJajserrU5670Su
         5gsvCeROlpcghQqBrg4XJy3CAQkDJW6EuI4c03xkXFVoGVVmHes9rZ5rBfDBqkqomfmo
         EmpDIhIZjSO0zjxnS0ghcJbIoOxMYfhTfKQjcprUbzLe8ewE1TmNiD9XQfJ81sT1V5vd
         PVdxsoLmpP+4v11s3AvPd+sRVLoMN1ndIIHDhf3S0j1bQL+nRGPxEo4WifUp6q5FzXmO
         1ObQ==
X-Forwarded-Encrypted: i=1; AKwUvBym4XCCQcisKbuN18y47PCXGqYUsAE1WyYhwQs0/Lq4T+CHT9PuKIWEbf6vkiBZZ8sL5F2aEOJ1jFZ8Qg==@vger.kernel.org
X-Gm-Message-State: AFuF++mdDWr1mJqK+6wUTW6aDXj2X73lAOxLQTbRZs1zqC9bJNw9RsFM
	ze+erjqsPPKq5eXoHQ76MOdLJUXgEz0mR/DUY8xnj0zqB41C9wkCRa09
X-Gm-Gg: AYBFou0N2qLUBRpLlcPjVQuV/56n3I0rTP/6V+UAA+Jm+i5fQQ7DN687NdMiSkSI6zH
	Ej+6DqM2J1w+Dgca5VL5gXSmxdJUaTVE/AcpUPdj+QHJ+aTOmxuG6E312TEdTDfY7/qykBTbP2g
	HNzFeVZwS4eTIvlzzDEZhJohPSq44ko5LGJ5M7xuPiJNZCuESCJf8KtxGoNPgPQjqwbPpsvpseV
	2Oqk7s30iEzA0XYvH0DZu9cSu+vTOoWbPzQ22guJnrDvxsxRNLy619aX0oLBfaGrZ/mKTABmb57
	KD18ZzFk9i9ZuNKGzjwsvZr4LmLqaNyJBDfFXYgCKsjEYnpq4kMPBNzYCCpohglAGGuia5UhCLt
	2jz3EQYBB5AJRiYur9Wmxjtjo1lLcz99r8Bbz56yNLi27l51dSylAMmynlvlgGUvGjyInhgB/g/
	fvror+bsD6QKUDf9Hs+FWEgkss0PaWrN6oKvUon5HIR0M7pPPnq1INxEwD4oqiasRfm1nPx0HXa
	Qoym8170D+y1WCQ5hgH5IxUt/O/qSOnkiUDAvCrUuCP3xe0/s5pWvdDdLWrbH46b7o5C39T0UfF
	TyGcS2V870T+5w==
X-Received: by 2002:a17:90b:2dc3:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39e54d36756mr10232434a91.7.1789738781094;
        Fri, 18 Sep 2026 06:39:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/15] ASoC: mediatek: mt8192: Improve error handling
Date: Fri, 18 Sep 2026 20:38:56 +0700
Message-ID: <20260918133912.133799-1-phucduc.bui@gmail.com>
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

This series addresses part of the error handling in the MT8192 driver.

It propagates errors from clock operations, GPIO requests, and DAPM event
handlers, and uses dev_err_probe() for cleaner probe logic.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (15):
  ASoC: mediatek: mt8192: fix APLL mux error handling
  ASoC: mediatek: mt8192: fix AFE clock error handling
  ASoC: mediatek: mt8192: fix error handling in APLL enable functions
  ASoC: mediatek: mt8192: fix MCK clock error handling
  ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
  ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
  ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
  ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
  ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
  ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime
    resume
  ASoC: mediatek: mt8192: Remove redundant error message
  ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in
    ADDA DAI
  ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event
    handlers
  ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event
    handlers
  ASoC: mediatek: mt8192-mt6359: Fix error handling in MTKAIF
    calibration

 sound/soc/mediatek/mt8192/mt8192-afe-clk.c    | 163 +++++++++++-------
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c   |  94 +++++-----
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  12 +-
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c   |  44 +++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    |  20 ++-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    |  18 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  37 ++--
 7 files changed, 240 insertions(+), 148 deletions(-)

-- 
2.43.0

