Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0923C660A
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160224; cv=none; b=sUCiiB8dwn4CN67aKvtjG9JcS3W+U0zkhlS1Oc98BkH/vY6qlQldIpen1C/YNQAbk4lWLc2IVE2IoE6hPTpadvKyU0N+rXzoHIqSsKZtCRR0SCDOKoF1qydwFsblZv5jmb8rEehW2OS1J65hpvvDOtnLYaHnWbxmoWokZYMBYiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160224; c=relaxed/simple;
	bh=8oegJtOi03HsgN93creTDzIpex0OLle0ko4k6FIeH1w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fWJQKsPFQbOiMGoF4uK4ipFNlxTbRODKhxwcO5TdnfSORSq5jWxlpbABhPE7QOL5wjsiyupQ2aVO02TxqHOrdnx5PUGuu4e/izj9HX0OPqDqVhIFX9iF4FEqm3BV8JZZOaS+P4HwbwRigGugHC+EOGM+YPA/ARMWa+f0EJqaFf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YqpYPpuU; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YqpYPpuU"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773160211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKuZ7sCTA23O6UMLzwIK0nZOTeVT/y7oS3+4wC3Dplg=;
	b=YqpYPpuUFMvPakjiAl1Q2H5dZcCDlq0qYcNktSN2LvQlC4RB/QAnT6gNg63ahA2npf0g59
	6427GcmRJjCT8rIgSWoMCgyMok2yhenK7NLlKF9o57DVwAMLJNSuqzid6jbgnrhT12yv8Q
	OaeCQbkBNT19blXwzAhCxMTUhnd3h08=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH v2] ALSA: aoa: Skip devices with no codecs in
 i2sbus_resume()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <878qbzradt.wl-tiwai@suse.de>
Date: Tue, 10 Mar 2026 17:30:01 +0100
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kees Cook <kees@kernel.org>,
 stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <933E291B-23F2-4144-80F0-EC5730F65B75@linux.dev>
References: <20260310102921.210109-3-thorsten.blum@linux.dev>
 <878qbzradt.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Migadu-Flow: FLOW_OUT

On 10. Mar 2026, at 16:07, Takashi Iwai wrote:
> On Tue, 10 Mar 2026 11:29:20 +0100, Thorsten Blum wrote:
>> --- a/sound/aoa/soundbus/i2sbus/core.c
>> +++ b/sound/aoa/soundbus/i2sbus/core.c
>> @@ -405,6 +405,9 @@ static int i2sbus_resume(struct macio_dev* dev)
>> 	int err, ret = 0;
>> 
>> 	list_for_each_entry(i2sdev, &control->list, item) {
>> +		if (list_empty(&i2sdev->sound.codec_list))
>> +			continue;
> 
> This can be even outside the loop and immediately return 0, as the
> remaining part is also the loop of codec_list.

The i2sdev pointer is only assigned by the outer list_for_each_entry(),
which iterates the controller's device list. Since each device has its
own codec list, list_empty(&i2sdev->sound.codec_list) must be checked
inside the loop; before the loop i2sdev is uninitialized.

Thanks,
Thorsten

