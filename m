Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768D370ADF
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284346; cv=none; b=CbtlIewJz9AOZPSn6DkfZRjI/usyeFGZ9uudXPcWlAD3bYZXqW+leiTIaiY4xaU3OWuFbwS58AHC3B2XDaS4WzTdWbygzBDFb1sKnMfsMUL+pZU3JKv4FFc5N32r5PRyFAGyu8cO2eLCZvVgXc7GJoVCBD8fV9NgAL+BrgA4DPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284346; c=relaxed/simple;
	bh=jK31UqatAJFEbxqs1KKs+re33g1ksFIFSBLvVz8VIzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txa8YzdSMbqyzZM6tjaBucyNLgeccect66KPaHkOg1HEyVo432ApX4x6xoVwzIAVVL/S6MOy+ShJZJm4r93op1JQgH8li/DPUjXBMaTdF4YqizkYqhHImIbtMwU/2hlVFzeEfURFjYYUuBDlGoXcIJsoJStgbaAHzcE9BtuOfEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lB5ds9SW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lB5ds9SW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791284344; x=1822820344;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jK31UqatAJFEbxqs1KKs+re33g1ksFIFSBLvVz8VIzI=;
  b=lB5ds9SWaJ41NAeyZeIcaO6ZB+aavGFxKTqg5XueIQnY8go8WvoB8mgo
   ieIPg+/SQ/XJ8j0d5yLNMMd4uUu+VxpP8iZTE7fBewUDCEh0WlqzXqcu3
   LuQb/HeVeVWyDl3NkkVco8bXKTsZk5qZaVKuGFvCLhhUDfsTVBtYVSMHk
   rvF/Q7PYiV+RXkfqSB2fbStOAHxLMJAAojtJ9CinFCeNJQaTnxmeWCupo
   ghv3JpVQmWxRDpmU4kucxqTRedid0cwmboQgputqDORLC7vA0Kr14O0O+
   gQ2bt8h/ZxSYJLY3wSRyPcs7T4vQ0+ugfDqR1+PldfWAC6XvDNxQfDTxh
   Q==;
X-CSE-ConnectionGUID: SH9FVUezSQKP7k/UOFvUGA==
X-CSE-MsgGUID: vMOqSa07SWy+BJ9eI8P7ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="8615"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="8615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:59:04 -0700
X-CSE-ConnectionGUID: /gn21iJRSkOgkONOwytDDw==
X-CSE-MsgGUID: l2ewrMPxRi22m8SLUnPM0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276653052"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.21]) ([10.245.244.21])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:59:01 -0700
Message-ID: <3cc10213-be28-4bd8-ab07-078ba715c50a@linux.intel.com>
Date: Tue, 6 Oct 2026 13:59:22 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/26] ALSA: compress: register the open file with the
 card
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
 <20260916120320.18318-3-peter.ujfalusi@linux.intel.com>
 <asTPAE4oztNl58QL@sirena.co.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <asTPAE4oztNl58QL@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/10/2026 13:35, Mark Brown wrote:
> On Wed, Sep 16, 2026 at 03:02:56PM +0300, Peter Ujfalusi wrote:
> 
>> @@ -174,6 +182,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
>>  	module_put(data->stream.device->card->module);
>>  	kfree(data->stream.runtime);
>>  	kfree(data);
>> +	snd_card_file_remove(compr->card, f);
>>  	return 0;
>>  }
> 
> You don't declare compr until patch 3.

Oops, you are righ

-- 
Péter

