Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3194C332EAD;
	Wed,  5 Nov 2025 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762359884; cv=none; b=OWtTtZnW5hgzRVGBukMctumg5S79aWDYjWkGfMj2wizs3UStjkdkjA/96zf21tPk6QExdNmpilWEv286mHTnTmAdl6A8C+vti5eOb0ARj6AJ77lsK/7PDAZjVwJ6wwGckXuKs17NSup2Dz0ZNAZHJkJgVdDI4JOh4Fdi5Pli0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762359884; c=relaxed/simple;
	bh=HISz9y7RlQpF/1/6WA2P9ceoVw4JFxeBxmMW/iZWQfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQTRp37yks/kdEAF137uSPDvBJ7meRXvmNi/MYFsNHKLJO5SSZxNB734n0kf6c45vTidDrkPPBmUA3eyLcb5TFZChDpagEvNk4PiZiNd1HDQZLXk1KGir81P38seK44Q4G0eEYXiIGOTD9qc4lOleWAwZtPnPDGKv5Kzhpc2+Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=lN9PEceT; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="lN9PEceT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762359777;
	bh=CrqcVvAlxdTVvK0bOKoV9e/MfkwpqFERHSk564OJ9+E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lN9PEceTPUezqu0bHYKwrhbeMqu7L/jphAatx/BcPSTiSDfqR+zv2Sq4xSd56liaT
	 FnKQekae7JfH8OyKD7u7xmBiN0XiUzydE7s0GeVQgqpMqDonVtRThHHvPZFm0o9hkJ
	 Tg9cuFD2LO2633lKmz59VSlcb1lNyUGtjEVDl9Y4=
X-QQ-mid: zesmtpip2t1762359774t5a699fa5
X-QQ-Originating-IP: T0kQ8LzCYEveQBPnZ+ZSWwym2FwrqldE+02gmCjFqUA=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 00:22:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14411868300707364731
EX-QQ-RecipientCnt: 11
Date: Thu, 6 Nov 2025 00:22:53 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Goko Mell <goku.sonxin626@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] ASoC: spacemit: fix incorrect error check for sspa clock
Message-ID: <83447AACDE00EAFC+aQt53fZVf6vMGsKY@troy-wujie14pro-arch>
References: <20251106-spacemit-i2s-fix-v1-1-ee2cedcdda23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-spacemit-i2s-fix-v1-1-ee2cedcdda23@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NhdiEwnVOUqEJmDCCN1QjuRE56jEleok/TDTIWYYNwFgYH6Y2w0cIvCx
	Kr6ga0sKamklztWryTB5WjSNiNi9ZLjS2ERAXSAfCNtQXDmxxA4A1wcX0J1ZCRmUy+uNQap
	vY7UnBbGjh+cP69aWOGX7wsr3424TlCBRis6g7e+lS4PTP83yk1NTDnokDCwAu1wXIlwroI
	PyYliWzDncF9Wa0Kmlm+d1ce7Ek2EhtO9M9TRqxus2v8mILdNEaZgLeKnUJm3r/HxekZURc
	Gc/er11/xlQtDvqJNBmmYr/G3uhRlnbrMNqGdGbpHXgHT3BmsYIE43Cwos7bWkIqBg45pCQ
	/A18QuQBffMXn2C5uVyBxB6ghdnpcxoM4T71rFxFUbPqaOCzxBdqLCW3EEc6fhThDpa45au
	v51+m9L7ugeebThjmH4LeVACX8hBMHjdzv4PjunBVogzYfdSWqcdfNbVSmOEmE/NrP4CT5V
	9tHkN22d8l6tHXhhJonPFBl8OeJGpNf9XT1sR4AqZ6wwVOhQtbx5mNpjpkeNmcrjQw84nlH
	lAwXw3AjXlGyAHJrfWZ+d/IVMUbP+AbTugtxVmc86iXoC62uyn1OrLdktlvqKqUn+Ol5H57
	EAdJuqZLL5NKKDwJs6aG+c/c5RG6AZWsoi3spP7OMcv/wBhmc6+WPs1h8tHlkgkW10NcJEF
	L7Vwn1y0Ka376OjINgWLlcKRQdojcqyBoRgntdz5kVn0HUZBI4Ycfc31ZKK5m9c95M8gekW
	6S9ppJRIc7/5H/dPyhwvVC19yShbi86/Yx/BYfvfMSddxkvA12PKzvzmWUr+DtzzRAtrh4T
	EOXpTy4chob2N5Jj1D+54zoAFwVFyt/WBsI7xylLqlWCTGUfj5P9YmQ40Lsy2+nFE/VNqct
	qKCZ5glRF0gcEx91kXHypeyaa4aUJ/Ruivw5QA54R0xazBxEUDlEB3cX9sH70g+NUxH9Jup
	vCzNCoC11srcQgtyYLcevHCebNHBtlNgL5Oi4vepDpN8pzPehzlXIxm76WubD7JNrSalH0h
	wDtssZS2TLVxQzPhe0O1WCg+FKQoA=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Thu, Nov 06, 2025 at 12:03:16AM +0800, Goko Mell wrote:
> Fix a wrong IS_ERR() check in spacemit_i2s_probe() where `clk` was used
> instead of `i2s->sspa_clk`.
> 
> Signed-off-by: Goko Mell <goku.sonxin626@gmail.com>
You lost Fix tag here.

           - Troy
