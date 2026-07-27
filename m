Received: from MTA-11-3.privateemail.com (mta-11-3.privateemail.com [198.54.122.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADB641B8F7;
	Mon, 27 Jul 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168222; cv=none; b=gZDb6CFsAxsMOsezfjaDVuxi9iz3MtboX6GI9JGiAa5dw6Pj9/doqlqSeCnzP+Sy6PeUx4QtxoN/tu3m5otVt/5sz+pGbDOcuGocJs8jP6NI1sciXTs6K6KIX2x1q7XKxa+IeSehTohT5yBOW1kqrFD0WwHAnkP7V4adkffx8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168222; c=relaxed/simple;
	bh=mfSWJSensOTXAZzQNgeihEjcOok3WVTw2Du0M3p7Pqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzO+HCwGtVExrtpTfER12bVOmGZDD3eX+UM8h7cc5Uk37Sv/mcX+O2QnYzGisFFaoH9KdJGZqfyNiJzteEVrn483mYCWPuNz2QbcHSgT2yXSOa21qNvfpOInBlJTCZtDKSMEkrKdp4COJeoRm6e3nJa9SPyQWiPpP+rkWle/i8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-10 [87.215.145.39])
	by mta-11.privateemail.com (Postfix) with ESMTPA id 4h83Kj0g21z3hhTX;
	Mon, 27 Jul 2026 12:03:20 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: support Senary MI2S
Date: Mon, 27 Jul 2026 18:03:14 +0200
Message-ID: <20260727160314.64344-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <757166fd-862a-4600-b570-00445a2af3d4@sirena.org.uk>
References: <20260705033743.305783-1-jorijnvdgraaf@catcrafts.net> <757166fd-862a-4600-b570-00445a2af3d4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ +Cc Mohammad Rafi Shaik ]

On 7/27/26 3:21 PM, Mark Brown wrote:
> This doesn't apply against current code, please check and resend.

Please drop it instead: Mohammad Rafi Shaik's 766f3f79c312 ("ASoC:
qcom: sc8280xp: enhance machine driver for board-specific config")
reworked the DAI fmt setup this patch extended, and the new
sc8280xp_snd_hw_params() already covers Senary MI2S, so the patch is
now redundant. Verified on the Fairphone 6: with the applied series
carried onto its tree and this patch dropped, the Senary MI2S speakers
keep working.

Thanks,
Jorijn
