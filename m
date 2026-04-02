Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD8A3563C7;
	Thu,  2 Apr 2026 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100905; cv=none; b=tSY5a3ans5M8ORWwu4MfdYbrv5BkQtY1U2iNvhQL9yiD/NNqmXHfU6/tg71gcG2JGc5znrj6mc5XKj0qNV4Lih6o0Jvk7HYIWiEpTdv+zbv1WYnZjD9hkNAva8m5mBWENOhKjBrczigGjVv45tYIWgwL/V8bFalktrM5BsfYnuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100905; c=relaxed/simple;
	bh=4niQXHdqNy8K3+WQBsURXhAWfsTflR2fJqCjKIkxZIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdSG01DHkI2rusAYNoWoScwuEF+RhkyStQccd0bjJZP55Cp1XOkxr3ytFudQvwYQHMkTluXtqxMMo23dD9wc0VIxVn5m4WpMPqpT427i+gbQ/4HXJfJZs47X48KnA5SqkUExgYjS3xWlMiudhU56kAqhM/pEf91x0VkuSc/TUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prbTBXN9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prbTBXN9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1990C19423;
	Thu,  2 Apr 2026 03:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775100905;
	bh=4niQXHdqNy8K3+WQBsURXhAWfsTflR2fJqCjKIkxZIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prbTBXN9qd0xNWl3Q0sLWuiIJClNu4EIUes+WbWBxKhvioUqO/AUIy71WEK5pV6f9
	 J0F8irtnJwfEX0sLEpkLzTd+dcrEzJIF4u543UKddMPCuFIXErAG1YJDd6lyRWA90S
	 ejORKC3fNVW9hsa+yEfLOquMI6q2jVrF28R0hFWEHDBgQus8yk9nDgOEi221q/+oE6
	 5p7mlo76NmstqQNQuJNyWhsxTr+NiFeYEIMI9dDczKdM4EsS07Rva4BitPxQNSE9E4
	 QHRtpeE+mDwtdORdYdTQjuV0oGWRKNzlbC0290QJsBU2cxTwIjGIZSZhnv3eGH6/4/
	 vhefsdgWNWG/g==
Date: Thu, 2 Apr 2026 09:05:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: compress: Robustness improvements in pointer()
 handling
Message-ID: <ac3j5U9ritCee524@vaman>
References: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401-alsa-unconfigured-tstamp-v1-0-694c2cb5f71d@kernel.org>

On 01-04-26, 17:57, Mark Brown wrote:
> While looking at an ASoC driver I happened to notice a divide by zero on
> a pointer operation, discussion of which with Péter Ujfalusi identified
> several other issues in the handling of pointer operations in the core.
> This isn't a comprehensive review, it's just fixing up issues that
> happened to be noticed.
> 

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
