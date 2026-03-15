Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E1F37AA7D;
	Sun, 15 Mar 2026 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773606041; cv=none; b=lVNOD1OhRf19GjN1j7V2wRDKTTyrlkJtoKnrnRiuoElj7WaNrzjR2cxw7QVdKY6aWmy+5qIm+7Knk+JNi1lbkJMrnDUYHyIfGgB0j9QlMQz9J+GrinADjAYnCt5TOzoI9uDmQqqsE4SryR20/QQqKiP4LXmFkMwvbQVNbf7Gw9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773606041; c=relaxed/simple;
	bh=8oBjD1my2oSRQYAz2pTBXFGPvvDaY74jbcL5KbYWWq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfzDS32dXdLSNCwjYDfstQMnagjfF3EeKEDiV5USI+IycFSuHlhp6dhEQkdzHEZUJcKv3J5Bj+o6rf3S8eGJbA3cZqD/eXKtY9BIlqlASeekWW2OdbDCQ9MBiwsUyTWXwMK4m2gBU+oSJV64NLTL9XGcb8NhXhEo5ijE2XfmRms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=P/mmP+F1; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="P/mmP+F1"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54136285F7D;
	Sun, 15 Mar 2026 21:20:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1773606038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jizx7hmuCMvbSEtEzRzJGy/IhSd82wJw6JKzmWM3Xaw=;
	b=P/mmP+F15KGYfuxJ5Po+FivErO9LuQw72E0Dn7DpmOOzKVyR7OhDb5o8pjZWO1RIyHGJk+
	zRPV6LjTS3xMXZKoxL5owD/pAvFEDaSolSZHCUScRTCIikqZ2NGtk2hN96gJioQNgF5pqS
	K4nA0aIqcduFffY14sRuiLmffffGTdyE0EP0mWDYdTnS95X8BTMWkU4jV2KgnEye6XqWhK
	Io6kzuaesMvv86QrS2owlIc+jKd039dhjMipwJ6/Ynk4TVEtw07gX0moGd+D6/iU5E/Tki
	E4rj4F5emqt8ZW3SU/X+vt36yl28K3AJTkbVmjWg7Ya63lHZPiej3p6pVNmbMw==
Message-ID: <0b451f26-fea6-4a4c-b986-228de98e566b@cachyos.org>
Date: Sun, 15 Mar 2026 20:20:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
To: Mark Brown <broonie@kernel.org>,
 "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: hasunpark@gmail.com, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
 <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
 <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
 <26a37f81-9c09-4691-9765-66da29dec3b5@amd.com>
 <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
 <7790d1b9-5152-495e-85f2-3b1068435d13@sirena.org.uk>
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <7790d1b9-5152-495e-85f2-3b1068435d13@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/12/26 9:06 PM, Mark Brown wrote:
> On Thu, Mar 12, 2026 at 12:19:48PM +0530, Mukunda,Vijendar wrote:
> 
>> We have cross-checked hw configuration. This platform uses DMIC connected
>> to Soundwire codec(ALC721). This patch should be dropped.
> 
> Thanks for duble checking.  I already sent my PR for this -rc, I'll take
> the other two patches once -rc4 is out all being well.

Hi Mark,

should these patches be cc-ed to stable? As it stands, I don't think stable kernels will pick this up.

-- 
Regards,
  Eric
