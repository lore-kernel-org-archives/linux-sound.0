Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62D1EF1C
	for <linux-sound@vger.kernel.org>; Wed,  6 Mar 2024 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709741944; cv=none; b=B0Gg0DQAtQM8FIfuunjeS5ORbrZ6Oi6RS7jqpPrgeXl3+J/dw8lwBji6qSDce8/YM8cVNsnLQFsaRLtE5u5ChIMskZOCJywsyVMjDpf28qwq8lbgH3hffiaRq/31g87m5jrpZGlqe7z6tG6yW3JTh31kh28VM97WamAVEv4Pluc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709741944; c=relaxed/simple;
	bh=GvHVYUIICAjaOAWJhNYu3ax4WnZhZi/ldWdGTVyeb5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZDsNh58cEDCYom5Oovm7kklQiOKORorFxGoQ1+WR07a7Ru2JjBY8IW919W3tknDsdB+h/9yXJPxFDABVdOsxJw1mY5EJDWKr4B8xEpGRBz/jVnW+cRbDSeAmRFLTQ067E4OMxZBJyM/EN+msLkgSMBi40Z+FEDO6qmg/R8Rg7mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=w5TNgDer; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="w5TNgDer"
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id hsSLrky0mHXmAhtywrRtB3; Wed, 06 Mar 2024 16:19:02 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id htyvrjeNzROiChtywrhUHf; Wed, 06 Mar 2024 16:19:02 +0000
X-Authority-Analysis: v=2.4 cv=H9/dwfYi c=1 sm=1 tr=0 ts=65e89776
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=VhncohosazJxI00KdYJ/5A==:17
 a=IkcTkHD0fZMA:10 a=K6JAEmCyrfEA:10 a=wYkD_t78qR0A:10
 a=CEfcKhwxmaDNtT7VeCoA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GvHVYUIICAjaOAWJhNYu3ax4WnZhZi/ldWdGTVyeb5c=; b=w5TNgDer9Gh3Pg1uMCPC6U4Azk
	iBJbZRsqcNsrwgzqGZS5ExHsPTxg2p+pXN1pA6U0hymRTv2UE2FBEuooD43q9C1w1ji+x2IdozLRG
	j98DSEZ2z5+aPB3tCAPRKLawdhcatSmAUhWgV4wYEgKQUbK8ILopk3IP9W/QukMhMYf6TM2SN9pLX
	VjUJdIoEnhdMLILYws+8kA+bbefw2Iy/YfFI8AaG+qWlBF0gmxdhPNwX7s9M22ErXeLYfcOKpXngW
	KduVBPEifkU0VlUISavWQr12Zk1Zd4plnZRt+swKX5eYMejgBU1jWWH6uN2LtOwGoXthGA8WbIcuk
	kHeAbxqQ==;
Received: from [201.172.172.225] (port=49378 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rhtyv-001RDq-0D;
	Wed, 06 Mar 2024 10:19:01 -0600
Message-ID: <6a7854af-a183-4db2-8400-4d9eb0cc4308@embeddedor.com>
Date: Wed, 6 Mar 2024 10:18:59 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2][next] firewire: Avoid -Wflex-array-member-not-at-end
 warnings
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net
References: <cover.1709658886.git.gustavoars@kernel.org>
 <20240306011030.GA71684@workstation.local>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240306011030.GA71684@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.172.225
X-Source-L: No
X-Exim-ID: 1rhtyv-001RDq-0D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.10]) [201.172.172.225]:49378
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO0NTmvJgcsklUEX9apo1S89d+MatbZjAccbt4r+9qZgro97weOdFJd49PG6NtKoNW9RO3HUUUP09DfWboLKI7ZbC1HlgBoawVTaW/zySCGitKAwZK/S
 Q/JYE6fk8yYJfJqgQdLTv/V6T32sw7YtqQ8BRKi68m67UGJvorahGSuEFV/inJ01VCJteUjtksqM7aDrwJTadeeaa41JHVu0cHdkketmg+TshEuXEa9snfjM


> Thanks for the improvements, however we are mostly at the end of
> development period for v6.8 kernel. Let me postpone applying the patches
> until closing the next merge window (for v6.9), since we need the term to
> evaluate the change. I mean that it goes to v6.10 kernel.

Sure, no problem.

Actually, I'll send a v2 with DEFINE_FLEX(), instead.

Thanks
--
Gustavo
