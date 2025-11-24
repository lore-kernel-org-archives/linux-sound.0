Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111F325DB1A;
	Mon, 24 Nov 2025 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981368; cv=none; b=HzDdLzloxLkU/FykAvHWyLKL+MCxmp+Dz9JAM2lW5dP7I1qqt+hAa2dz05qftVQzX/X2fZAaPLKqCMfTnGa4xJYPXp2unx2hAMQLobifGVa4aKC+4oxA/u9p+jgzPVAyV6nBTiILiWSr6whT4zr6jGmKFJmZvVYPWxAdd4okXzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981368; c=relaxed/simple;
	bh=accYO1hEACWOli6OSfMo+JKjCxultg01y2n7ZyXupnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WH/XDrMRs8Ra/hybjmtRGdsBRORa1WJdNdmMTQ1ep8DOaaXw2FifM4JaHPdIbAqrR+0nZrOeUNWfBVgodHQrWpZmLC/xmLtErER20EE6iBdEoSVstVvmGnY51l6J2mi+60UBNYM6oR1EKNRTMLZLffOwFZipARUvImMh9vWmb5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnD6JWAn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnD6JWAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4FCC4CEF1;
	Mon, 24 Nov 2025 10:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763981367;
	bh=accYO1hEACWOli6OSfMo+JKjCxultg01y2n7ZyXupnk=;
	h=From:To:Cc:Subject:Date:From;
	b=UnD6JWAn5mHQht9DYsRkuRtVb2yJaw+wDX0Ch6ZoNR9Ub8DtbSVa1Tw7X0HhnHw0s
	 gTMaef/aI8BjVCzo5GulwDtio1SS/uMeiPE7MH3bSzkGbib3yoJd8MPTcARI2uMzh+
	 zIL2g1VuDTjsFHyrvw3gRiBs28e45KAMrbYfCeytkgtmsmtaxOvKA+TIAj62NMytlQ
	 OJS8illr0qepELlfOLJE0CwK/oecrxEv9gELZxC+e35lvLBNFKDP2HUe/wnklRxzsf
	 7LA16yeG51RwN+xJ8hVfFgKlOeNpeKJmyFv2w35SfI0NdSxo1yXkX57yKPi2Simb0/
	 Vl+DSlZ2XN/xQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vNU8M-0000000046X-1xLu;
	Mon, 24 Nov 2025 11:49:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] ASoC: stm32: sai: fix device and OF node leaks on probe
Date: Mon, 24 Nov 2025 11:49:04 +0100
Message-ID: <20251124104908.15754-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes device and OF node reference leaks during probe and
a clock prepare imbalance on probe failures.

Included is a related cleanup of an error path.

Johan


Johan Hovold (4):
  ASoC: stm32: sai: fix device leak on probe
  ASoC: stm32: sai: fix clk prepare imbalance on probe failure
  ASoC: stm32: sai: fix OF node leak on probe
  ASoC: stm32: sai: clean up probe error path

 sound/soc/stm/stm32_sai.c     | 14 +++------
 sound/soc/stm/stm32_sai_sub.c | 57 ++++++++++++++++++++++++-----------
 2 files changed, 44 insertions(+), 27 deletions(-)

-- 
2.51.2

