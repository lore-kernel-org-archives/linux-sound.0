Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C2329CE1;
	Thu,  2 Oct 2025 12:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759409140; cv=none; b=Yex6pKHF4r8Ihh+EPgCboywyXCfArU/Y0/rfVtrPIpJcZY6jSENApGUuEubUWyGIwxQxL44UAUWywFJbZmMBi3rfgu70VRpf3zQhzXk4C524TQQJXzDvnuXIsYppmTwB3kepiAHS7OlJUhGWUZEpX57GoPamY4abso8OAVZ4L84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759409140; c=relaxed/simple;
	bh=ophrfccU9/Pyl70FwqNG7prwo0aWPRlKmQ4E61GSSN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vi/I3vqKun/l5UCsqDDyHGJjK1L1m8rf0ek0XvLuCKh5EGNsbSbys8ej4uRmFede+v3l+GECk3sOLpoAHRn1fSzqyf9kTb8NOtooAmI9wXPtSagr1Fdl4kLklNPUWbuyhxrEqi+qcjsEsztyZK3c4921S6sps0IhQZXXddVOMa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UelIIhjc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UelIIhjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759409138; x=1790945138;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ophrfccU9/Pyl70FwqNG7prwo0aWPRlKmQ4E61GSSN8=;
  b=UelIIhjc6HqrwBeeuyXzgMwvMT7FSfos7C69eRCD/dijz6rXfL6Oi1e/
   uePEMhR1+rW7AHi+u481SQe+w9uPzxTlZjkXoX0Un2Ghf54/vLMb+Kl0/
   Tmpq0m+9aT7w7any0Die1cx9+0toM5FvcLMOrq0zCcRMBSKQO1Zdqvbbl
   KDHQGa3tBta1w0XgFu0HkmpMLWfqZlzLNgPNNhgj4RjE12LbU9b3eNOvV
   8eaDoMcjQSVFigVPMbV/qKOrc9nwtd2Zd5mN0a2BJZQSbd+EQ72HdThKW
   s3d+sNAdgKFbm2KeIzU0dcIwOpINPqlSgsg/UD195HAhfz7NgbJ0z/wLg
   Q==;
X-CSE-ConnectionGUID: cFqbzGFuRP+51bXwY782jQ==
X-CSE-MsgGUID: WxsjZQDPRtiY6LXLuIFhzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73120033"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="73120033"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 05:45:37 -0700
X-CSE-ConnectionGUID: +7Pve0nZTNC6dMiSO0z+Wg==
X-CSE-MsgGUID: bwdjxE9WQ1mn7TKsT5H+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="179817123"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.8]) ([10.245.246.8])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 05:45:34 -0700
Message-ID: <f60fc257-36ed-4bd1-af1a-6fca4a91a532@linux.intel.com>
Date: Thu, 2 Oct 2025 15:46:30 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4/Intel: Fix the host buffer constraint
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 stable@vger.kernel.org
References: <20251002080538.4418-1-peter.ujfalusi@linux.intel.com>
 <88555c06-ccf5-4639-b13f-892149b5faa3@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <88555c06-ccf5-4639-b13f-892149b5faa3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 02/10/2025 15:25, Mark Brown wrote:
> On Thu, Oct 02, 2025 at 11:05:35AM +0300, Peter Ujfalusi wrote:
>> Hi,
>>
>> The size of the DSP host buffer was incorrectly defined as 2ms while
>> it is 4ms and the ChainDMA PCMs are using 5ms as host facing buffer.
> 
> None of the fixes tags in this series point to commits in my tree.

Hrm, they are upstream, I will check and resend, sorry

-- 
Péter

