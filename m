Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD432256D
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 06:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755672249; cv=none; b=S26u0u618L1mxMtfY7nlL/dakxIcfPqsszzNhwK8nsJeqpfSPSfjOsSgwbGys+e6cQroEZrAW1iyAwJCUNFYmK87N7eiw95unjhD3m1EQ1qKVuJA04vzQl0zce6BfHutWSsat+Juqj6c42pitVKDY9yy4vW2yCBvuUMFwn1AsCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755672249; c=relaxed/simple;
	bh=UjDTQRoZv2JpQyn5jVZSc5/MkQKOuSnET32nSBAvZlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgtZem11oYxcw/jXPv7pWQ7cr3gzO9yUaeUyxJP0bRBrddGjhEnTIB/Kbhfy93dO1CGajOVtG88fEpEFwQBywP3yJVKWamqaMPEGATRGOVipX3tYHSr6XytR9JDizNmUdZ7oKq6bJea9l1xZA2F9zwzAyd/q6WGnu8NzbA523fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=db+c5rxB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="db+c5rxB"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so397716f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755672246; x=1756277046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ca+sHHJfBtLlYCIIifJPFcIpqB60osm+WWWvfSezYso=;
        b=db+c5rxBqNHUPpuBR6k533kXKBLjr1M8enkL2wGo1mW4IquRBG+JFyh1OqFyvjcwzR
         ZZqTJkgcqTdFEkehDZKjfYW5kO8it2Ica4YrD1M2pdgQNMGdyigKvBIIca6qx2adK2To
         DgwEFc3gm1Kp0hGitsX1goBQyCLcnrbMMLPoOFPOr2zXXo/8FB5BqEAs+Cq2N6PswTQ8
         9coPCKLxwf4REvw3yoPRqmT+y8nOw+bMYEkS3sq8qxL8s0OUO/kKU47S8y5PqZLGJe0C
         lEJYTQOnU4fxQPw+NnisCUae/XpsmPZyfDeBJNgLMeTSTpJFIyNGJu33hGQyU2Zi3Azj
         XzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755672246; x=1756277046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca+sHHJfBtLlYCIIifJPFcIpqB60osm+WWWvfSezYso=;
        b=TWA2A/7DALQgRx/fTUIJylHRx/zhHxglohxyG8iDWk/ppKvmHiJr+q/PGQGte5q+T8
         qhkdTeqSJ6JSFEVFv1NTnAI6rEHKEXmQzESJWdzSlCikDBseRSQ2zVg1hyfBNYTPIkCA
         IPW5ZYi04xXN2ub7ww0q5q8B0aO8Ltw1sp9JyliOSxHanTNtK8yjPte/ClptCo2O8V+s
         uCuay+rDpiUU7W/TwWd2IgcryBVKVQMpyN0aIv6dbosovH1HGGyUWoygaI5KzlGJmviY
         uXgJL+kO/r/9AVLnzXyhQAqJyChVTLjhuqplzX6f80ZNAc1jhsDS4DPsYIFRRnSKMsd+
         eGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC7LjM3ZFl7ItdcSwLBTwJ1WtMejI/3+aXBWLAeaadVHa1PBBiowF1SBPbh9evIQhdjlC6Tt+Jr9zB3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IwU0OynROzLx1AKIB3Ue2THDKepphmICl5cW0tQ2ETSJHoSH
	xjtsmxwu4do3L+N3uw+XhYzQf0/v+UoN23B+c3v6KIxNDdDbVc1Wig6+/Frcori2gm4=
X-Gm-Gg: ASbGncsgEq229HW6eCY6mA8xVB4x3RrZld/25/GxS12GZi/jpm4OJo7uP61GaZGvlgA
	NHZGzb/ZsZCuqV7qafgMIvH2si1a6evCBnKBj31JL6HbQGrj2+uV228v9D5DVHCqmA4CH0mW2WQ
	GKCiv2LO5WqRHwnEMPRPVo3NeEvkN6nbAUJ0Teh0YSq4Dvw24YaUUhVQfo4cGmZMizsAmcG2HzG
	tYjA1IaNfb19mjr8phSSAEJJ3hu70gSKi3ddjskCeR1PeNqHYMa8H6eVwHhb2gg8osMcR8dg+Ml
	X5tFO4nlHyA0XSTNZd3THmRu00lgqOQfrc7S1qE74tWk9zDBXAhJPxl3wWV6r+0E74C0ZknIyGt
	4SQlLm7PwBaom/uJ/Kak/JYw+60ZloFHqTXQiSrQDtxc=
X-Google-Smtp-Source: AGHT+IEbdnNwo4oJeDPciQ8EIBQEmtCB3Kmp9sG6xxzro0qvoVfD68XvPSQhTVIjeim78/KydRRKRA==
X-Received: by 2002:a05:6000:40ca:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3c3147b50b6mr1512172f8f.14.1755672246117;
        Tue, 19 Aug 2025 23:44:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0777884e8sm6939837f8f.45.2025.08.19.23.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 23:44:05 -0700 (PDT)
Date: Wed, 20 Aug 2025 09:44:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?xaBlcmlm?= Rami <ramiserifpersia@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2] ALSA: usb-audio: us144mkii: Fix null-deref in
 tascam_midi_in_urb_complete()
Message-ID: <aKVusmJ-sE1sgZVV@stanley.mountain>
References: <20250819185133.10464-1-ramiserifpersia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819185133.10464-1-ramiserifpersia@gmail.com>

Awesome.  Thanks!

regards,
dan carpenter

