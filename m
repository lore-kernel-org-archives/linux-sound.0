Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1470413E03D;
	Tue, 18 Jun 2024 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727098; cv=none; b=btbZM7tTyjdtZ0+zQrRU6uodqKKKmyGrDggdPrIibylVvsdX/RrfHbeQTSiH62Y+Dvll2agm1ZTLInnRlNhvrJ/e2qvdHVd2ht2I0ndudUsE/lDsv6XAB6wbRk1X09UQSnIcmyvt7PElpM539/1aZmW/7cLaHG/PojXdi5HEQig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727098; c=relaxed/simple;
	bh=U1eICDI/h9OCAW3WGTnf9X/LL1vDfHPHFkrVRTHdRKg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MfWfMwdAtbbB/4gILN2UBsOUrB1hKV2rXZG4IycC9D6NTUJrhY9fOUi/uThjBGyVMh5/7zGA+hWs36ZZixx3ya5TcGkYMXaS+xs/osuGEHp+4/nmMRZaqEEsTCGuCPX+lNFNIKgjm6rMQLMHazgFeMIcI49GSyw524UleqCFlOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EceMiuxK; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EceMiuxK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I5jYvI001893;
	Tue, 18 Jun 2024 11:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=F4jv7ND6r+gHtUmQre
	xrvv1xFoRQZRXCB9kZAU/xEsQ=; b=EceMiuxKntJKD/R6KC7lBjtRebhOhmQA1n
	vMsOFdWo91Kquid3x7aokUOxSiNXYMMYz00asm51B5eXU/icpyccaJ4yx/GXAf/p
	+RINtNetj2LpVX/Jphd81tQrzkGvHZQJMDwNpC/VO7o/J50kQtoYD53bodBOKw1t
	HRq3P2Ncx/YGEdEofH7YQgsW9nz1G+I7VfIqRBlgGZnwRzJbiQyZSUubk5h5mTVi
	UoWasyahhFuaAjPoMjRZSmU2Hx88cP5h6Tt0Mer3NBu2pbRo/Qtd9LK/jO7hC/C5
	aYeHk1xcctAA3RKTFPQci+SECxFI9lzFpVqWUm6ry8GRkjKoZDzg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by3nxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 11:11:33 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 17:11:26 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 18 Jun 2024 17:11:26 +0100
Received: by ediswmail9.ad.cirrus.com (Postfix, from userid 15641)
	id 9454C820248; Tue, 18 Jun 2024 16:11:26 +0000 (UTC)
Date: Tue, 18 Jun 2024 16:11:26 +0000
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: cirrus,cs530x: Add initial DT
 binding
Message-ID: <ZnGxrv1huWcxkJ9o@ediswmail9.ad.cirrus.com>
References: <20240617190102.1010597-1-paulha@opensource.cirrus.com>
 <0c59482e-ce40-450c-af6b-91d19f647775@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0c59482e-ce40-450c-af6b-91d19f647775@kernel.org>
X-Proofpoint-ORIG-GUID: WTXuutRQyDc0pATXNhK4Yh3d6szWjCGE
X-Proofpoint-GUID: WTXuutRQyDc0pATXNhK4Yh3d6szWjCGE
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 18, 2024 at 09:30:59AM +0200, Krzysztof Kozlowski wrote:
> On 17/06/2024 21:01, Paul Handrigan wrote:
> 
> Where is the changelog? It's v3 but what happened here? No explanation
> here, no cover letter.
> 
Apologies. I made a mistake with the naming as you pointed out.  I will
add the changelog moving forward.

Regards,
Paul
