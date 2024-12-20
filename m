Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1E722ACDA
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715663; cv=none; b=B47qkJ/v6jV27I0W21iSp2Xn2T6yzHrMmH2edMwHObRumNOnvtaKctJBCLaSoeOLBVjs4t+ROqUXnJyV39XKDn0RB9w3RFkEOw099qOaSRjb5etZJ6Ys5b0y3QpeMF8R0jrmmkrNHmY0y/DcWr3NDcTRgtGZ9qJxY402gMxMAbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715663; c=relaxed/simple;
	bh=ftFlFL8Hf6gjCPdcRFrVx2YclVhyvU0X+h6fy2EfzIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cFO3PXzGsB6yixtV/5l0MAknzrfdpXUu4gXI6KNn9m3t3JXaOeDaBwkBabo9S53Yi5b5hTn0zg0PK2jgBiYr9aW3Dy4Ln7JPbMbua/zDGJWwKKNCPfgwfJ5cKid3cBo4D8hpMXMzCqCrGWNmHGcWXedVvFhsPzDkymmibR1m6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sux4smDW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sux4smDW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e87b25f0so2163221f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 09:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715658; x=1735320458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=Sux4smDWvhRYVAocCLrB8sH5Gn4iglVnvLOtYXjw2SwmbrW98B6c98IdTir+VF+VQJ
         W10BWI4R3GFC1zT/iJoBlxuzYK0hnggsfABamHJxaKShxH8tLAyw6SYs1kiT5Zpq5DY/
         y8F5G+SxDNISHMSnfr/J8ZC+W2oNrTFwJ0KMsYltX1nRmRejzvK8hykx9rw4E4PSCPjK
         hBR+wlIXLMxbiloh7lXnf5z8TBJg0j3ePqZ9LWqb7cYYzpaMr36BzlgWIDpW6dDQHpe5
         znRcS8BpCe/go3BIeiuQzZZSpEoYEyOJCj8IeINw++6FJJgIOUIPFK+PvAzsigdqsUly
         aZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715658; x=1735320458;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=NPBjSr23cWesLxSpm6CozaJPzOjqoWqC72eAKwBCbo+c5ZJCY7MVbU964oii2Wzrqj
         Ds2DY93dYYHy6eBFs0RaDMTk7Eqd+NP5QEwxcuojhZipJkG8FtFjhMSG7U10DnFJgYun
         49vlVdyh/f4IATz8cUWVudOy8S3MEEX4boRY6iac6eWwI6gYyABx3h+iXy/LdhjcT4in
         4fcm9mCzWLw6vAdI8/ZFvn97x2MUgPdWQSRHMUPkNNf7djy1tpBrFGrMKde2SSjCZKoM
         yKZ7FY/A+48/CqVXLPtCsgx3xADEc8xAiimYUe39daXVBT1SEmCIH4oeTHGyvZICTJxf
         voVw==
X-Forwarded-Encrypted: i=1; AJvYcCV1g5zbeIkvkhR61tNcm5r3YJw141Dr2qtSvs6O/U9/LalEQxaLJAhLFrqTxgfAqYmz5k0FrDEZNE/hyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLbm24duRrrb0OxIgZWgdd4QnNubUgS2nZVKT9V8Ym5V/27v9
	c5Ywy8kGAnc86J7cyi63eC7kMmb95vehDObkDxlADBzHOOuYBJ8miTu9oXLbDLc=
X-Gm-Gg: ASbGncuHKnDmAdVeDd78dtsCbjXifXd1aEP1liOlMwHU+bGyUT5SHjqsxu0FQsxcSzO
	VrQ9I8ON7Hh7Hj3TMH+qJgrSwSVlI9Vv6gGHNwPyOYeftKeOPGp/pelZuMEpsLlIDebgQ1hfwei
	gkKH1PR47EAvk+9UoicO67BzXeX4MDbueKzHfsDYtHkHOzskcHoHqLFZy7i5fDd7FhKDTtECElr
	s15FOlQsuz8Q+x66nye4g6szGplp85P67yDtZ+Y/OEMlE9qxRRpmG8F1v7magxWgZ2inPH61m8=
X-Google-Smtp-Source: AGHT+IHQofl14bIpVpiQqz6qAEwAjKsEmWVjRCOjis6wH9jKfvKMjWLHCbYlsDgmYPDOjR7ci+Y7xw==
X-Received: by 2002:a5d:47c3:0:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38a1a1f7253mr6745803f8f.2.1734715658179;
        Fri, 20 Dec 2024 09:27:38 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:27:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, audit@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, linux-mm@kvack.org, 
 maple-tree@lists.infradead.org, alsa-devel@alsa-project.org, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, dccp@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
 drbd-dev@lists.linbit.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-leds@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, tipc-discussion@lists.sourceforge.net, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 linux-trace-kernel@vger.kernel.org, Neil Brown <neilb@suse.de>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173471565665.227782.7244101246430956449.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[31/35] slimbus: messaging: Reorganize kerneldoc parameter names
        commit: 52d3d7f7a77ee9afc6a846b415790e13e1434847

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

