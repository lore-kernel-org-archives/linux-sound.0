Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE96199385
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 23:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=136.143.169.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768260058; cv=fail; b=PQOClnpmqm8MA60v6k+7ReMR0agYDpth3NhwaLCACMRhlCbDHjjIkesgQ5vGpTSdmM6Ojchrg7vso7W41yZkCKCcHJWVxitrn/yG8g1Z5i0LTLUdHCa4N1VvrAntEcdjdHVFLeOkSao7JHI+QEP1AvYgmnSQL84ERJauYKqXIx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768260058; c=relaxed/simple;
	bh=CA99KCoCvn4U/rH2HKYj8BcIExQ/Eai8NjM3nAqsbx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QjufODlk/lTLsV08+8CPjM8by+c9JbMCp8HconY+iSq8JbqB9RFp2qNe6O/UY3Aj1aAdqtpxUG3vZeIomXozTR+rJ2eg6JIBV3W5q5AkTM5f9691vlUJ+uaVQLskH8IjMS1vsgadJ3X+E8bhLTwsfSMCYi3kwz1en/38VXTnGY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me; spf=pass smtp.mailfrom=redaril.me; dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b=G5vjkWh0; arc=fail smtp.client-ip=136.143.169.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redaril.me header.i=development@redaril.me header.b="G5vjkWh0"
ARC-Seal: i=1; a=rsa-sha256; t=1768260023; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=LF82feLtdsAF9tuTd16XFiMfzqhSLl31ISaNTVs+QMKaxgeZDPEyn4SxlXYE224flHpnBg5EbXNVfLleog4fmfxZUIEGTXK4dsZ9obIldtdY17/9BsCr0osZuG/9WuKldvtPnjAeDOwYQ4Cf2zF4O6VQ5dT+X4XLxrDBzx5F8bQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1768260023; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:Message-Id:Reply-To:To; 
	bh=LGw1xDlxHQVaX4O2QWsvmODQYHyTp7RwXl5O+JR7vM4=; 
	b=gtlazlZXX2d0ayFRYVPJlOQrpdkC7/e2yfHbG1s/j/NtbSsVs9VGnvQoeKP5QBUytUhWfry3ZuI9r77h+O9A3m9SzJGdQN9BOp5aQDRbcjtUfVVkFpEMvX0AAT+bUMnI+YAt709tucW/qWeZkkro8Wl+CxcQz9BmmB09TPAGqro=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768260023;
	s=zmail; d=redaril.me; i=development@redaril.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LGw1xDlxHQVaX4O2QWsvmODQYHyTp7RwXl5O+JR7vM4=;
	b=G5vjkWh0gU8YYF6TI4fL3ZqNz6RRbMm5qhcCV83uYO5MdUtsHHCusAc8dhsiSS9T
	6RwLLUarwO325EYz0RPrvs/xMopRzDCNBZ70XuOrXxwFwzpm86hGAcI1sgt2QRl2BGt
	nXu9kz9m2unkTYprt7NSLHVqmaadKCU+bGJQME7s=
Received: by mx.zoho.eu with SMTPS id 1768260021884426.60366989275565;
	Tue, 13 Jan 2026 00:20:21 +0100 (CET)
From: Fabio Forni <development@redaril.me>
To: 
Cc: Fabio Forni <development@redaril.me>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 0/3] simple-card: Improve probe's error messages
Date: Tue, 13 Jan 2026 00:12:21 +0100
Message-ID: <20260112231855.193030-1-development@redaril.me>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

this patch tries to improve errors messages that are printed by the
probe function of simple-card. Some messages were missing and I think
that made debugging difficult, others were printed even though the
underlying error is unrelated (e.g. when devm_snd_soc_register_card
is called).

This series is tagged as RFC because it's my first contribution. Plus,
patch number 3 touches many lines. I'm not sure I'm allowed to touch
so many lines in one run, also I need more than a pair of eyes because
even though patch #3 is just a refactor, I'm not 100% familiar with ASoC.

Fabio Forni (3):
  ASoC: simple-card: Do not print "parse error" twice
  ASoC: simple-card: Replace "parse error" with a more descriptive msg
  ASoC: simple-card: Split alloc and init logics in probe function

 sound/soc/generic/simple-card-utils.c |   9 ++
 sound/soc/generic/simple-card.c       | 141 +++++++++++++-------------
 2 files changed, 82 insertions(+), 68 deletions(-)

-- 
2.52.0

