Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2487B3537FE
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 03:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812650; cv=none; b=MDsxmBH5K88h3gHKBkJ2O8BWbSkAbKhSLetKuuOwpTAMq0hniIq05swwWiBvYz2Zh59cQPlg25bUMEGtPs4Pm3qTtaj8i8I8OSUyK3vZWOskOpgxY/qQiUpwWz9tBlr1SnDlGxAK6pkfIf7FiztfxI0VF0X/9cO56bMN4W0rCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812650; c=relaxed/simple;
	bh=WWaYaNc67DbZawLdQCgWjtVzDWYu6S3tdymBthN9lco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POA6FIAvXkRvGs4RvVhn+a5K02YqD6gfs47Tsso4zn1pvkORNxvT2NBBSPhQByBIX5z5xIljlLD+MOasMBUp2QpjvI9dQdjWZ/I0rCp5wAP/Z/l1DeQOy6crloVtdptmoYz9YR9PexoC52MS5SUutlLppxrWdICi7Qeu0ge4Dg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcL9Ed4H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcL9Ed4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4151E1F000E9;
	Tue,  4 Aug 2026 03:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785812648;
	bh=kEam7BqlvyoTNRKtmukZNB00ip1PJB8GXpqjnWDr1QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JcL9Ed4HRrh+cRZHKrrNIME1Owj4BXYyz5XGYgVuA4/Hle6ujQnm/gHKSnuy+Ouhy
	 q+Ymol/wbsw7LHSp5De28qtwust8c6I8FjqauYpb79M3u/l3YeG9c2BUh7/GuH62i1
	 gQGFMYiH8SJYRGkTxiqViSqhyRSRVMhS+xBchwR9tF+NOo/UyJskaenlDRs+Ibskxc
	 W5DYg6qa0gcTNX6LbjT18dFG0WO07W1iV/IBdEmUNpHBpmfQqfTlyUG0lgleyo3l6b
	 /vRNIi/8L1lR26w94i2pU9+tmH1qn6nqfOpMCzvJpchnD59NcXfL1GgJJpiPRaq9Ne
	 q/xIDMv2RvS6A==
Date: Tue, 4 Aug 2026 03:04:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Benson Leung <bleung@chromium.org>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/44] ASoC: codecs: cros_ec_codec: use
 .auto_selectable_formats
Message-ID: <anFWpTuzLUx8BN0z@google.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <87wlu6wwcs.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlu6wwcs.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Aug 04, 2026 at 12:41:23AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
