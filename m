Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225EB1E8332
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 05:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791783111; cv=none; b=SIyImBJs8a76IgEISTKU+xj6IW9NuDRAwGqX7z+dzxzWTUnKsrKOH1VgJmPjWvVanhCznyfH/TzISQcPRVTm5jeP8yXd9dqJruyUABtSpRAnbLWioPENXdjFw9XJZP3/nbL5mplXC42ZOSsopiMwyiqVz/aOov3uwA6yE+lQq1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791783111; c=relaxed/simple;
	bh=7nkADHEp5x0DBoPoZtKbSuxWtdaKOt2lVNr1L5cD6dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eo6yaQpSlxWH7IJZkxe/kEn2VV6xObKIVGHC/K5YqFvH7/lk0tQ6DfMa90xOlSO5DQgwRXrYwPK7qwjwBnbGk5taFApV87HMKfgSHmWru63kwK4wxnJvATOETd6GWlsVDp88ebOj2grlXxc0OYEascrRnMmFAnLJUVohDKEQZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDyE+9lt; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDyE+9lt"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-170135e43c7so553759c88.0
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783109; x=1792387909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=;
        b=VDyE+9ltZ/gVpHegSLOcDQ00wXpXyRlS6oUf45exlaD5d2MCGAt0cC3kcrTcpiYLuK
         JDHkV7bExNzF4bFG57PZti4ZOyw8nQyOoesIBe9U1sFuY8K3+m+j29MYcms2vaHZoqL8
         X0dRK3mtz8MWp3a+tXlKvcpMN2wHKiMfOiEYmnssDbDIWoJBG1D/FNL3N3FGXoOnlM3s
         Vkvv0yoCftE/QbrISlv9DfviIX464l/5K1EziWwlgtbXHLc+pjG7BCkjnuC5B5pib5Ra
         hKM4ccJ5bbXJ6fMP2hGYSxuUoA2++F393/ZSFWSjGRGFa3RxRBmu4oZVK8zNSdN0S0fW
         SG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783109; x=1792387909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUHR+jwX20wnPasopncz+EdY4KBemgqmO+gzErpgMVo=;
        b=xnUFlfsbMjwvrTRs4blwh3Y/Il9R7RlWPlMhPWhYedvEuluarI7nQOdz8FGu+A4nlJ
         DM090qJ4vW4YYhvBCCfdPqHbKRs/dhtcW0XHMVnLAI1xjFd+EERatTaViELTqrACnijT
         2/IfA63QO268E5wBdzaSqzWQlA2PEywDm6DgG/0Q0l+k5eg86xVPqUbAGGBgKP/ZJkB2
         KxGrACWIClFHgJuqdFblA1+7g3D3zKxfuhDlOb3z0QjxI245VgGS9NZIrY/fadvZgB8n
         Sk9mEXW8C34QWiS24JawC5GIBzG7yQ7SMINH5VMZYTYXbq61xEao+q0wzIuX6RWUuH8p
         N+Ug==
X-Forwarded-Encrypted: i=1; AKwUvBygx+FKjyMJv8nemevBDDmui/4bJont9NovTtGGyemqn67aDgmrc0Qq5kt0r6lMfxUMJkyVbvsvLisPNA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6KtBCvXdwSxxcMQObRTisxLuOsYk0NBO4jIUPGqUTXWgbu1Dg
	KRWol5b9X1uop8vvr66tYjbcniUIymXyq+kLnbWeXOMID3OiByFtNk97
X-Gm-Gg: AYBFou2aTQeBJz5gjTVH8pqeNI5i6lTp7iuzxbRnb2j9/lfrHum0q2K86TbH2PaAi+O
	YJq5M0Z6n31lk50HV9nrse3HlCtN2l/zKl6pDIywLX2JtOUkkzR21DhFtUK7FpytRAZIdW0VM6l
	YXvj7crLbfLcdokW1M06BnTxFygykasnOThzPCI1qaZcmmPbhfeRWrba75vd5Rlw+hB+OUxU+rB
	zDu0SSvfpbinKodAPPCN/gn7CxhirtCPw9lC9+urSaFTSQwpVoSDdjk8U2O93MX6M8ig2KlnCOl
	y8wMILg4XuaE1b0vA8D6noNdlKFt40RevE3cP9gX6GdbvK4/YACDCIsoGBF9YaquBvpGnMrm9F4
	wORhGEkVSJcM0sS+iCaWo+QHmgJyv/9piBH+SLvZs1ADfEd8DP7f4tleF3oYrv+18HbZxFEu5bW
	nphQ9PGtUwU6z2FFu7TZCXDlAg4tV/4P++n1wuU8w3Chi+SLuJ56ZmquqRF+8Md0zF4KBm/YP3x
	VeXc0dn
X-Received: by 2002:a05:701b:2510:b0:13f:c85d:17bb with SMTP id a92af1059eb24-16a5888c49cmr12926299c88.1.1791783108925;
        Sun, 11 Oct 2026 22:31:48 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm33513653c88.9.2026.10.11.22.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:31:48 -0700 (PDT)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()
Date: Mon, 12 Oct 2026 05:31:19 +0000
Message-ID: <403cc04bb103dff096edf72b99ae6868ee91f359.1791782072.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_iir_coef() looks up a resampling coefficient set by reading an
index "k" from iir_coef_tbl_matrix[][] and using it to index
iir_coef_tbl_list[], which has 8 entries (valid indices 0..7).

Before the lookup, "k" is only rejected when it is >= IIR_NO_NEED (11),
or equal to IIR_RATIOVER (9) or IIR_INV_COEF (10). The value 8 is
neither a sentinel nor a valid table index, so it falls through to the
else branch and iir_coef_tbl_list[8] is read one element past the end
of the array. The bogus coef pointer and count are then returned to
mt8365_dai_set_config(), which dereferences coef.

The current matrix never produces 8, so this cannot be triggered today,
but the bounds check is wrong: it relies on the matrix contents instead
of the size of the array it guards. Bound the lookup with the actual
array size so only valid indices reach the table.

This was found by Smatch:

  sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:271 get_iir_coef()
  error: buffer overflow 'iir_coef_tbl_list' 8 <= 8

Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/67af3580-a907-403d-8bfd-76b5c304ab99@stanley.mountain/
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index a058973662b3..2e678f4aa4b1 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -267,7 +267,7 @@ static const u32 *get_iir_coef(unsigned int input_fs,
 		if (k >= IIR_NO_NEED) {
 		} else if (k == IIR_RATIOVER) {
 		} else if (k == IIR_INV_COEF) {
-		} else {
+		} else if (k < ARRAY_SIZE(iir_coef_tbl_list)) {
 			coef = iir_coef_tbl_list[k].coef;
 			cnt = iir_coef_tbl_list[k].cnt;
 		}
-- 
2.43.0

