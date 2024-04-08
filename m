Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0F1142906
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712596978; cv=none; b=f1QbaIvCxEUi6z5zPBo41Xg8atNd1LDiPxmhxVJBtOdT6P02ahUP8C2sx7uLuSadUjKUcOjnXogAAOxZa+/Qr+vabc6PdhI49eof4xMi1ZQbjrI2QqOl4WJv+xeRlT4XN+kNY3gMg0bvanIJ4221RQfGSzHsI6c1TlBpd0Fn4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712596978; c=relaxed/simple;
	bh=cx3lvZtVCA4R6BXGBfL5aNQwMBLv2iVL2cgfzIFw1G4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnEp44A5kV98C0sQTY/pT12HSX+vQbo3vLrmwbwUlDJjwHePG18K30WvrzbuDEE8FtX/n/yN9WGFRmHEZhCXPk3mlLJKx17eF0Kvck6OZS59pQ/iMQTrWiSVnc9w7YoxJ9MD71BgiTxMFm37UThZzq9WlDBV38SGQHxFxyWBRCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBQn4hHf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBQn4hHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712596976; x=1744132976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cx3lvZtVCA4R6BXGBfL5aNQwMBLv2iVL2cgfzIFw1G4=;
  b=VBQn4hHf25eanTaohLPr8r5uie/R27lnnbVM2RMjepGFrwJ87iwTZEPn
   fPKfs8Iznhie1qInJw5JzZiOqHvKpsTtVRfLrMvtW+aNKvf21Z8HRjWiV
   KtmC8XswwtnwxTuDd7lIKd2bm2DUbswHUamDChjGeEIjWtKjYQXiaONlB
   WvkRKpE/ezWI4pj8tFQd8MwaN8+sat+Kh3MHiOAjxZ+eCZwpw7ozAcFte
   PVtcoMP8QmxvBsRUn4M80iwYw5LL+bhpL+0G84xsgodp6kIFTF48GXvGo
   8Do57BCs/hzu0xVbBR6/FCH9J00fvcnK+nluMH9sIpyTnpf2zruSz3x9G
   g==;
X-CSE-ConnectionGUID: NJ6qpawITz+/uXBdx7ldyw==
X-CSE-MsgGUID: XaG8CqDYQhaQ9vBhdL+QwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7757424"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7757424"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 10:22:56 -0700
X-CSE-ConnectionGUID: k+CtTFHrSM2tzYeIf8lcEQ==
X-CSE-MsgGUID: GCF7GdmZT/GEnKt73nGffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24697432"
Received: from shahsmit-mobl1.amr.corp.intel.com (HELO [10.212.101.141]) ([10.212.101.141])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 10:22:55 -0700
Message-ID: <697e9cb7-8e10-469b-8d9a-6209ec7faf5a@linux.intel.com>
Date: Mon, 8 Apr 2024 10:29:49 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Apply Asus T100TA quirk to
 Asus T100TAM too
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240407191559.21596-1-hdegoede@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240407191559.21596-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/7/24 14:15, Hans de Goede wrote:
> The Asus T100TA quirk has been using an exact match on a product-name of
> "T100TA" but there are also T100TAM variants with a slightly higher
> clocked CPU and a metal backside which need the same quirk.
> 
> Sort the existing T100TA (stereo speakers) below the more specific
> T100TAF (mono speaker) quirk and switch from exact matching to
> substring matching so that the T100TA quirk will also match on
> the T100TAM models.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

