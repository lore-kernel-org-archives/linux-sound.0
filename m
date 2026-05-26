Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F403955C8;
	Tue, 26 May 2026 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779832407; cv=none; b=KV9vb7DzAk9ZmS7qH9/ZhCvykX21kFY+KEa6HUzOkHjjwXt6KY3mJLkkEkgJoKbbWd9Mg0HStkz2bXS2DRe/63pNTqvAgvi3lw6nN7Pow5kD0LVj+My/lJ5BSmSfNe2m60yHX2eZIuhU0n9n4dlCckC80iIE/qq/PudukfX4PF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779832407; c=relaxed/simple;
	bh=ycLyNS0WRY9T2Mxnmcml3IHXUG59wOj9j1WccfQd6r4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BCoLdEw1efI4ce35mIzi1ZN7Urie5cFrQC8kEEWPXOL9i4/hY0z8i5i0vT11vGMvi337sX54BY/znWmCRYW8P+ruSErWz1EURkDmLjKlJHzba9FwAiiwGIpc0nhu7NPGoGUvEjBrPasqtQqmvVBvsOEpFngWpsUWVCzTv5V27Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsQkTund; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsQkTund"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABED1F000E9;
	Tue, 26 May 2026 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779832406;
	bh=SOeRoKfVwaS/9fi6euE39b9F7ct/UNiYt7MV/Zqm9FY=;
	h=From:Subject:Date:To:Cc;
	b=NsQkTundEbYVVo8EJT5ZccSgv1gzg7PkMlzW0RPtBoFsqxthr3VYhkQ3/Dtx1pN+P
	 w1lzamhhV4kntAeLy/Ss1hvtazH6iV8EhrySr5JJ/w6xjYvvHROcAZUL6DJEe8ELgB
	 un90JLp/KuZkevCUKDVG1l8Ih3rpyx03iYlQIV3LgOI1wPx9jwvMuv378s+m4YPkn+
	 vn9+gpNvkJSBwIAdbh8LIl3oK9Mk/zuBxbFh5hmcRF5cK5d5O5kekdxzSpSfnQs0UG
	 rIDgn7AuA4Lt1F8j1smh6HMeKG7mSiVjo4B7Dq8dYQGtx983oVJYRtQeD160SxVnTM
	 uH2ECGz4utfQQ==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] ASoC: Address es9356 build failures without
 CONFIG_SND_SOC_SDCA
Date: Tue, 26 May 2026 14:53:11 -0700
Message-Id: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EQBCE4VeRPuuEkRnsq4gDptAOVqZ3RSLef
 cc6fqn8dZIiCJReyUkBu6i814g8TWiYu3UCi48mkxmXWeMYWhfWscfGoxxQLktTFbVH3leWYrY
 F/IdYNe1j/fYLhs/9Q9f1A4im4110AAAA
X-Change-ID: 20260526-es9356-dep-fixes-772839de1b85
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Zhang Yi <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=957; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ycLyNS0WRY9T2Mxnmcml3IHXUG59wOj9j1WccfQd6r4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFliYkFaTPf5fmxf8VlzeXFGwxcG2ZjDh7baf+67W6zG/
 /vNHP3ZHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiJdmMDG+m3bv94G+yFeO/
 jPvXO03ctbcb9nHd3dmUkBMju+7stgiG/6HKTLHfRcQLlvDtt3rB/Inxrlq0nWvSBbGvO1Xr2PL
 NeAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

This series addresses the build failure I reported at [1]. The first
patch allows CONFIG_SND_SOC_SDCA to be selected by a user. The third
patch fixes the actual build failure by requiring CONFIG_SND_SOC_SDCA to
enable CONFIG_SND_SOC_ES9356. The second patch is a standalone clean up
to make the third patch diff cleaner. If there are any issues, please
let me know.

[1]: https://lore.kernel.org/20260518224657.GA536765@ax162/

---
Nathan Chancellor (3):
      ASoC: SDCA: Make CONFIG_SND_SOC_SDCA a user selectable symbol
      ASoC: codecs: Adjust indentation in CONFIG_SND_SOC_ES9356 definition
      ASoC: es9356-sdca: Depend on CONFIG_SND_SOC_SDCA

 sound/soc/codecs/Kconfig | 9 +++++----
 sound/soc/sdca/Kconfig   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 2fd19f0d589e703c767949b1861b2cf8c2a6de12
change-id: 20260526-es9356-dep-fixes-772839de1b85

Best regards,
--  
Cheers,
Nathan

