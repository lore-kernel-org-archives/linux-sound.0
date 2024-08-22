Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7086F1B285
	for <linux-sound@vger.kernel.org>; Thu, 22 Aug 2024 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724292865; cv=none; b=t1ckX5EYxVs93jEzsWcxaZ0nGDODkeHuWLoDwxhVuU0dWbnPVem6KsRMCzbeq4+1JSlRmtoBMs5BqVakCOaDFtkk487rOjJASU+DbydfnQB/L/sNdM/LjXCfBX012bM9EYIEKmikHSxU4+mMd+hgXzllbfZNCSLaGTs1zclVbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724292865; c=relaxed/simple;
	bh=9a0jG/hjOh9ZqWD1HetHu6HBFXTtcK8Fxc44j2/ukr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KgB6NFLYJ43deya17jf34nxSXAryLnYZEpfzWkx2birtPmUJmpsrpW5gnaQES3BqemMK2/A4x+y/RQ382OdzyD6xkH2voALixa3EGYHOrhFaXDMJKf+d7gG8TuineL9OFhepaL+w2DLXOMsD6rM5ANpQ+oJmc6ElKBQ13rFOKAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wq6FJ5YFzz13mRj;
	Thu, 22 Aug 2024 10:13:40 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 959FF1800D3;
	Thu, 22 Aug 2024 10:14:20 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 10:14:20 +0800
Message-ID: <d7c2b0dc-5875-43ca-b740-a6af6d98ee76@huawei.com>
Date: Thu, 22 Aug 2024 10:14:19 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 0/2] allow modules autoloading
To: Mark Brown <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
References: <20240821061955.2273782-1-lihongbo22@huawei.com>
 <8426ce31-f877-4b9f-af41-55ab479f0524@sirena.org.uk>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <8426ce31-f877-4b9f-af41-55ab479f0524@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)



On 2024/8/21 21:29, Mark Brown wrote:
> On Wed, Aug 21, 2024 at 02:19:53PM +0800, Hongbo Li wrote:
>> Add macro MODULE_DEVICE_TABLE, so modules could be properly
>> autoloaded based on the alias from of_device_id table.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
> 
> As documented in submitting-patches.rst please send patches to the
> maintainers for the code you would like to change.  The normal kernel
> workflow is that people apply patches from their inboxes, if they aren't
> copied they are likely to not see the patch at all and it is much more
> difficult to apply patches.

Thank you, I'll notice this in later patches.

Thanks,
Hongbo
