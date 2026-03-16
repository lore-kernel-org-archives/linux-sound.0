Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85B830C615;
	Mon, 16 Mar 2026 03:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773633037; cv=none; b=qulIX9ril1vskA/+/tCPievmvgVQoGBgZzos+6kKdzQuOiXYssuaEe2O3pH29ElDvmbz8LTbLzGSLIYmcPzlDko4f6AXY13ze97IpTCnnCBqYvMTjHPxBL8aZEFrtay7ZylXxhg8L5sHf1QDmB7ILVVIC8eVlXc4oeUsNVdg4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773633037; c=relaxed/simple;
	bh=blbDYA0RoKqp135maqlyE8//VybPw5ppNIKszkXa7Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hk9n31q24JHq/pXEcz3UmyGozawWQS8BIV50b482grKtw6bVTx6TyltGO+R7H+oa9mdaM4KW7xwOPB/7lEb1W+0G31ap7JPvRfbUdomBbFV0GQ1SZQKj022hLeo3oV9hwQL1jnYdoyGpLcqjO81DugYc4efe29KdtxRoZr+3oQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=gBUG38fB; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="gBUG38fB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F319285FF6;
	Mon, 16 Mar 2026 04:50:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1773633033; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zme3QaapNpJjiGVgLcLctqb2+et3KDYi0+9JfDXPfa4=;
	b=gBUG38fBtkIuogi9gTvtu/d2NgWxs/oW99luH+cfkMXY1S5tQc8OhEYEuhLwWG0L84c6fc
	HPVWBMNgC9P0H5n0ssdCnMMbh1jHQHvykaQoODYEmSGcGheNCjUB23+cdCaDUf1sE8Ly1D
	81gFGikiidEiP+qf1IKtty8zTJbP8dgy2lHxTPghKCbOgGNboKw9Ieqkt5Seod6LJLbTEJ
	8RdaoaEivO2RQ+GWwiAgKPlfGyrq9eeoETXSnUIRQUtDpT25IihFzO8mOMiGseSsn96Nx+
	hBWU/jeElhZ2YOwkcsFAiMnJ8/Zq4m5WDurRkbnzSOmYT66fDTPuI590vpIjGg==
Message-ID: <93c9f211-9ae8-42ec-9043-aeab6d327848@cachyos.org>
Date: Mon, 16 Mar 2026 03:50:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, hasunpark@gmail.com,
 linux-sound@vger.kernel.org, venkataprasad.potturu@amd.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Gong, Richard" <Richard.Gong@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
 <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
 <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
 <26a37f81-9c09-4691-9765-66da29dec3b5@amd.com>
 <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
 <7790d1b9-5152-495e-85f2-3b1068435d13@sirena.org.uk>
 <0b451f26-fea6-4a4c-b986-228de98e566b@cachyos.org>
 <abdGjyMVd37aNqyL@sirena.co.uk>
 <d25102bc-476b-49b6-9c5f-25f0c6277888@amd.com>
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <d25102bc-476b-49b6-9c5f-25f0c6277888@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/16/26 10:30 AM, Mario Limonciello wrote:
> 
> 
> On 3/15/2026 6:53 PM, Mark Brown wrote:
>> On Sun, Mar 15, 2026 at 08:20:00PM +0000, Eric Naim wrote:
>>> On 3/12/26 9:06 PM, Mark Brown wrote:
>>>> On Thu, Mar 12, 2026 at 12:19:48PM +0530, Mukunda,Vijendar wrote:
>>
>>>> Thanks for duble checking.  I already sent my PR for this -rc, I'll take
>>>> the other two patches once -rc4 is out all being well.
>>
>>> should these patches be cc-ed to stable? As it stands, I don't think stable kernels will pick this up.
>>
>> Feel free to raise it with the stable people if they don't pick them up.
>> I gave up on tagging things since their automated selection of patches
>> picks up vastly more than I would ever select.
> 
> Eric,
> 
> Hold horses on this one.  Vijendar confirmed the hardware design and this patch is wrong [1].  Let's not get it out to stable.
> 
> https://lore.kernel.org/linux-sound/a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com/ [1]

Wasn't that specifically referring to patch 3/3? There weren't any comments from the second patch and the first patch was also accepted (begrudgingly). Please correct me if I'm wrong.

-- 
Regards,
  Eric
