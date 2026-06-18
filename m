Received: from scc-mailout-kit-02.scc.kit.edu (scc-mailout-kit-02.scc.kit.edu [129.13.231.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D332D5436;
	Thu, 18 Jun 2026 02:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.13.231.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781749549; cv=none; b=tUkRwmKS7H5ve+wptTdJlCydeHrgGz2phL1NAfWxVp6hAKUESw1UVabwIkYpJoKXubWwQsEqXNMiQAyFCHZKAbjghsEeqB3ywaI8LxF4HElC94iAJb7r2le7VcYvRNEFSl+k2crElTx4zd+icvJupWZ63siQWmZRSPyPU64QyuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781749549; c=relaxed/simple;
	bh=S+C6DOvGUdaDiq853H04iQkivcFMATiLmWU2QFt//qI=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SKpGaaqByT/AZtYy2k/ZIrH25Sruq42ydDzL44qysXU/2Y4w6Z1v+Hxun4RDj0TQalTCtfSDYXoeMcHGWVcWM3GxdDpF1HVAn/Tzn+viMDWGjTe2j7kJ4PnvTih99JwbqckLJwdjwIkW75VkPpnXI2HHL6vGlrgF/R56IH9aRgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu; spf=pass smtp.mailfrom=student.kit.edu; dkim=pass (2048-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b=Vdlwq6z7; dkim=permerror (0-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b=Z9dQLDrW; arc=none smtp.client-ip=129.13.231.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b="Vdlwq6z7";
	dkim=permerror (0-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b="Z9dQLDrW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=amZve4u1N519P8NdduVos1Pm+jOhuG6AtioDItcBY7c=; b=Vdlwq6z7PzwtJmxZCLn/CJHTwo
	d8FggSqsKKcpTn1I1H9oVlr/SCsT6a/CLVy/G20Oi28OSbP0MPebuKozlHCLJFUF3FX8BDMltt8of
	UZSVtIM4TZXFF14L3yDzTHwvvGIkvgSauAJ1+kq5z4zqatfHqAEA0ASysGxxDTzDvJc9rf5kSXa+K
	VXnrvafEge4HKGpkzruBfIn8FM0ywUbqNZMhiv8D1TUXSa7c9g3kI1/qnnknv20rg60aqps/qKhzw
	7XsW9+yo8lw4rMnr1HIbKLLAZXcyBaBIpo2TbWRZ+86Cf9n0blLe8LHJVpTnC5wS0mnUU73JMs8aJ
	DuivY4ow==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2ed25519; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=amZve4u1N519P8NdduVos1Pm+jOhuG6AtioDItcBY7c=; b=Z9dQLDrWTOTAEmD18DxkBiXcK6
	ZuZDDzJyXvNOQf+tdiRrXrYWxgHin7u7S2Glap3Jt5LTrZV7zuPrSgRiSACw==;
Received: from kit-msx-46.kit.edu ([2a00:1398:9:f612::146])
	by scc-mailout-kit-02.scc.kit.edu with esmtps (TLS1.2:ECDHE_SECP384R1__RSA_SHA256__AES_256_GCM:256)
	(envelope-from <julian.haarmann@student.kit.edu>)
	id 1wa2Rk-0000000B6nX-28HB;
	Thu, 18 Jun 2026 04:25:37 +0200
Received: from [IPv6:2001:16b8:cbc8:8300:5f96:1ba1:8be4:f919]
 (2001:16b8:cbc8:8300:5f96:1ba1:8be4:f919) by smtp.kit.edu
 (2a00:1398:9:f612::106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 18 Jun
 2026 04:25:32 +0200
Message-ID: <d3d88133651998ec4cee5b831978fe8e4c16b14b.camel@student.kit.edu>
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost device on Lenovo
 Yoga 9i
From: Julian Haarmann <julian.haarmann@student.kit.edu>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Vinod Koul
	<vkoul@kernel.org>
CC: <pierre-louis.bossart@linux.dev>, <yung-chuan.liao@linux.intel.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Date: Thu, 18 Jun 2026 04:25:31 +0200
In-Reply-To: <ai+5CrWRj5lYv4F2@opensource.cirrus.com>
References: <20260608160203.151943-1-ckeepax@opensource.cirrus.com>
	 <ai2eWeTlhFtNWpr9@vaman> <ai+5CrWRj5lYv4F2@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-15 at 09:34 +0100, Charles Keepax wrote:
> On Sat, Jun 13, 2026 at 11:45:53PM +0530, Vinod Koul wrote:
> > On 08-06-26, 17:02, Charles Keepax wrote:
> > > There is also a "non-pro" version of the Lenovo Yoga 9i (83SE) which
> > > also needs a quirk to disable a non-existent Realtek device. Add this
> > > missing quirk.
> > >=20
> > > Co-developed-by: Julian Haarmann <julian.haarmann@student.kit.edu>
> >=20
> > Need sob by Julian.
> >=20
> >  - Co-developed-by: states that the patch was co-created by several dev=
elopers;
> >    it is a used to give attribution to co-authors (in addition to the a=
uthor
> >    attributed by the From: tag) when multiple people work on a single p=
atch.
> >    Every Co-developed-by: must be immediately followed by a Signed-off-=
by: of
> >    the associated co-author.
>=20
> Julian, I assume your happy with me adding your signed off by?
>=20
> Thanks,
> Charles
As discussions (https://github.com/thesofproject/linux/issues/5801) are
still ongoing on if this is actually the best way to handle the issue,
I'd hold off on merging right now. I'm adding my signed off anyways
because I'm not the expert here.

Signed-off-by: Julian Haarmann <julian.haarmann@student.kit.edu>

Julian
