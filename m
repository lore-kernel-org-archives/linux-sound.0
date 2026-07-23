Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F243BDD3;
	Thu, 23 Jul 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803375; cv=none; b=deZTW/wAOPbNexC9CUF5w8pFSqS1r63nzuYOPWiV1VCauQdNM7La6rYrGUgnuAInRdHFl8iN6Ow5yhwQwrHTvFFEl+5/dwz+APnUKZcRKS3kIe8VXrPB+6toq6E1ES0Bm2zUHIygBvQXH9kMyeQwwfbUp1AxPYKkgWdkroFXQtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803375; c=relaxed/simple;
	bh=1CeRFMg2w99HT7E06IMl6CqxlNckMmu/6g/X+QA4gtA=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6j22Mwm2TEkJuXhfZHh+lEpMSvDUy+yry4mxEqPn3O0UXNUCfKZ/ERdcd2BNqRGbAwQnfz/ZnL4T9SXD4mnLlsqrQShJ/UdjR8cXMkhqbcH92/8S1b8yNfMaiGrBDBVT1Vx005/Rb2LnwDUdYV0eZuJYUW3nqOUftOI08kdOAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hQ2KCZ3a; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hQ2KCZ3a"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5C9C8875C3;
	Thu, 23 Jul 2026 12:42:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gkgq2_SLdJj9; Thu, 23 Jul 2026 12:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784803367; bh=1CeRFMg2w99HT7E06IMl6CqxlNckMmu/6g/X+QA4gtA=;
	h=Date:Subject:Cc:References:From:In-Reply-To;
	b=hQ2KCZ3afd2ng62ZHwbwRSsy0/SImdTjnPxrBiObOu8yQZnGVEkDDxK9NbIhtZWDz
	 oKC+AC3TaWxAzIHUaP7IJ9BDfxIg2fDdwMgtEGeWbY3PGt968hlqVmGIrWK5RjJq9a
	 s5o6FvIYLRaSpbUB2t+fUam3uXmH4rfeXgz+2Wnb+kDaZHG0TI8Hsnw9oZJOEIcA2k
	 bennANGLQ+Vckz6jEy6cUfagWSFYXoSVpGq/lJbjfqju7otjlXbjRFiDA/M2pBeB7a
	 oKAPyIvqK3KIMgkvjL9QTTwzhUalurlFalcdMtkzbsaFmEZXU64UMK4okswwG0Uihl
	 mtpdyymWj6Sqg==
Message-ID: <3ae265e3-8de1-4a22-823c-e7ba5e679cb6@disroot.org>
Date: Thu, 23 Jul 2026 12:42:47 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop
 16-bh0xxx
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20260709214414.8461-1-skbotnl@disroot.org>
Content-Language: en-US
From: Sven <skbotnl@disroot.org>
In-Reply-To: <20260709214414.8461-1-skbotnl@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
Is there anything I can do to help this patch move forward?
