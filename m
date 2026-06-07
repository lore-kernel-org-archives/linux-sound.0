Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CB2773D8;
	Sun,  7 Jun 2026 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780843144; cv=none; b=c6HqqKC/+SKUR2/eZM215F3WF/RokPKAytcWIU+oucrZGdDAOLKutvoEFAERgtzjb14i50Sn0bXTOciYszh/c8FHtJStrZQLUcOiyg3BhWzQUNrPPGTrLKrKBs0+grGfywrav1X2Gx9ASkQecD+ozvAtQhUiRkJj+ADhRpo3QxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780843144; c=relaxed/simple;
	bh=AOxSbMUCKlmVj0R0feu1nQMLHjLgW6UaI9Z9s5pxtA0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMP6GoXZrvNvojBNvwQ2H8kqfsYMqu5EdGjsXQTLY2vWN/tmoEko2DcTBsJt2zsp5tu4ay4FYxTkWTdq3QVrJllevK9GcFN1uOrsjrQPT0K+Ejk5rtB/F8KD68Qu6MrB/e9gExJSeOonBhnl7MA+gJKxoQpY1pTOGFGG5QyEmss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=cvxsLRg/; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="cvxsLRg/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=a3NJdCV90LMtPNvVuKHagxW6LrXuiStVGAHImHGD6+A=; b=cvxsLRg/39ya/8izifwzOr3YjE
	BywWF6BFQfh1B82RpHb2s3asmSWX/qMMihQiP0adaOIU0PICb5N0mch5OLvSMDdspL9zWTFazOaf2
	x7UIagl5b/GSJFiIM1TO9He0U+YClzUHajffayanEFtWa8JSMA5/G5/tJ/Wvk0MJaKs2BLjG3OP7C
	LMVsIF3Koz/EcMbBPyyr1VBR/qG3XwOliVjqRyiN/UqA6bMqe5xA3nJu8kFpXEcWgZf+Z3LsirKFB
	8vn+fu0TS5di2AvKAJM6GJjC5Xgvl/abRCp1HGPfF+Dlt7Oy1x8SYpO82HXIylrp6eWEUV45MuiLO
	JJ3FoHPg==;
Date: Sun, 7 Jun 2026 16:38:45 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Sen Wang <sen@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] ASoC: simple-card-utils: support system-clock-id
 DT property
Message-ID: <20260607163845.652bcc73@kemnade.info>
In-Reply-To: <20260515161358.1462453-1-sen@ti.com>
References: <20260515161358.1462453-1-sen@ti.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 15 May 2026 11:13:56 -0500
Sen Wang <sen@ti.com> wrote:

> Adding an optional, u32 system-clock-id DT property into the generic machine
> driver so clocking topology info can be exposed in DT.
> 
while having this binding would solve some of my problem. I am wondering
whether is the right approach. What about modelling the clocks involved
using the clk framework, so let some more codecs/dais be clock provider.
So things can be configured that way.
E.g. tlv320aic32x4-clk.c

Same for set_div() which is also unavailable in these generic cards.

Regards,
Andreas

> Sen Wang (2):
>   dt-bindings: sound: simple-card: add system-clock-id property
>   ASoC: simple-card-utils: support system-clock-id DT property
> 
>  Documentation/devicetree/bindings/sound/audio-graph-port.yaml |  2 +
>  Documentation/devicetree/bindings/sound/simple-card.yaml      | 10 +++++++
>  include/sound/simple_card_utils.h                              |  1 +
>  sound/soc/generic/simple-card-utils.c                         | 13 +++++----
>  4 files changed, 21 insertions(+), 5 deletions(-)
> 
> ---
> base-commit: f5ffe03e0678 (linux-next)

