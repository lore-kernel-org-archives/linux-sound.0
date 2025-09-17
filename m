Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A15922A4E9
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 20:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758140550; cv=none; b=E19rWovrm1k9jxv0/WR9rt7Uc0Dpa12NU/7tIKmwdL7uuhbgwwy6sKjXLC8RcRzMriR//FQagnAvAM2BMsQKLcV0jvIui0tYRNfXlHKci0TRzYj69ff/wmnccg15fvDcV1JHynIQ9niuJj7gQcvV6cILm7/CyC13c9PGNGvC54M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758140550; c=relaxed/simple;
	bh=Vit7HNH5NzOwc+s/MAVZ4zVENbf3YQ7l89oavvJmcZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQ3zpZC1LeIUDGeoo6gp4CJl+fE0u6c5obIEyb9Xro0b4FpuFTMia0JZT0OzNRAjFtJ3/gou9k7AQND+UE5dHp8U8iIvioyCkbBeV4IvDgF1OImGYrbMBXLMas2VEHEmuCiyNXW0qJ5KAJClGtroNiWfj6ncZqvyADmguH0/Hec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mQ41yCdl; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mQ41yCdl"
Message-ID: <893d6efb-14e4-4b1c-b114-dda207579bca@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758140547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D867LtrkF+GIxGAqtwPTuvm9RuEpqtSynbXnTOVc/2s=;
	b=mQ41yCdl3c4fpnapHbaXetuHzFcCzxHM2Ksuvd70hz4CGxkWd68+D6L63xL1GxMYbbIM2s
	b7fTdK6SvvC16HznYCtERN0iDt1aqp4ICSON/8KnVSrEJfk+3ii8H71OV1SViZuKAFpiaH
	tEJQNZUg3bPVFdlSforWUJvpX09TIp8=
Date: Wed, 17 Sep 2025 20:53:04 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 09/19] ASoC: SDCA: Force some SDCA Controls to be
 volatile
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-10-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250912103504.2679226-10-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
> +	case SDCA_CTL_TYPE_S(XU, FDL_HOST_REQUEST):
> +	case SDCA_CTL_TYPE_S(XU, FDL_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(XU, FDL_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(SPE, AUTHTX_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(SPE, AUTHTX_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(SPE, AUTHRX_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(SPE, AUTHRX_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(MFPU, AE_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(MFPU, AE_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(SMPU, HIST_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(SMPU, HIST_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(SMPU, DTODTX_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(SMPU, DTODTX_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(SMPU, DTODRX_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(SMPU, DTODRX_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(SAPU, DTODTX_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(SAPU, DTODTX_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(SAPU, DTODRX_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(SAPU, DTODRX_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(HIDE, HIDTX_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(HIDE, HIDTX_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(HIDE, HIDRX_MESSAGEOFFSET):
> +	case SDCA_CTL_TYPE_S(HIDE, HIDRX_MESSAGELENGTH):
> +	case SDCA_CTL_TYPE_S(XU, FDL_STATUS):
> +	case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(SPE, AUTHTX_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(SPE, AUTHRX_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(MFPU, AE_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(SMPU, HIST_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(SMPU, DTODTX_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(SMPU, DTODRX_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(SAPU, DTODTX_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(SAPU, DTODRX_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
> +	case SDCA_CTL_TYPE_S(HIDE, HIDRX_CURRENTOWNER):

Maybe reorder these cases by entity type? or by control selector? The list above is a mix that doesn't seem very logical to me.
