Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4274CA779
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 19:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365363; cv=none; b=TLby3Wpsa0lUIF3YlGL6H1YIVUxK/xwoUi3pPuZDX68F+6ZC7Tms5gANNpKC8kqtgsHqBrLV3v1kfPyXgQA/oeZuZKaeovLIoG+pq+C6uyb27JHaBgSiavV+wn9sw1X0gIB8QqLeD9xaWce2M8ONoO5YEuOWLR+F2AY3c+8U3qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365363; c=relaxed/simple;
	bh=1VWZYciLHbgddZTdHE/3XXjdoTgU8Dsut3G+9HXnAdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fm3gZrQITIqjd/rDbBoIrskKz2JBapRTqGXE16t6FA+TazDDgvo6E/dvnwDLKkmeaGRIcJfESNBvCRiu1yT5gr+9RFTAg2TXEYdK1BO4pKONOEeX1IJCzWpb6ZsJd5m7lbf01td2o1X65/Q871eH2KXiNb5sosMvOpEEfd5la0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2AJXEJs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2AJXEJs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so6497555e9.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790365358; x=1790970158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y01LBiaH2IwpyL6MELf0OxRYiwawGfhA1ZMvZPY+wcQ=;
        b=a2AJXEJsI5MILmvdYBs0fj6UFC46kJXV8LAU7KYp8UAJvwTwshqbr9I9roNEcrLpiH
         WwYVxH1K9eu66s7kq5DcfrU2LkVZsR9fuCOQGAgDS3YZ7Kc0Dek6gfvN8mBA9Fn4A0CE
         SjkyIpqIY3cgTXcJ6oNQLLhP3DQaDLT2UVP7llRM4MqaNkKBhJvVGbN9jg+VDHdR3Kfu
         FsX3U8MvkO1m9vMp8Pvjisw1bqSpHuUzWfqG7JcpXvp0rNWmhg3bVrnFtUOTFOdPhv4G
         WtOIuLYL0EHEiGWOwwbTTvVkYRQmV67H7I/C6ttwbpaaLeyLiAUGMu/1//7322e9a77P
         SgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790365358; x=1790970158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y01LBiaH2IwpyL6MELf0OxRYiwawGfhA1ZMvZPY+wcQ=;
        b=G7uCNzAp7HgApJ4fKF7SIS3+G9sGB6s/RTE4+hacjaK2myMVywLmhF2DmrI8V0mjrs
         vxeqTzJxvOdzTfRWk33BQHlPFzLkQPJO+UVFWpkHaSdi/5Bzkeggmow1aRUJRaUtXNE8
         7ap6uULmZaxxpooqeGsUj5Lzro2GiLdevbV4XZBVbQL5PdTNce0g4S4wwkgVbvZ3yY7G
         0itj5GR/bunKy1C/c/PoPxPcMhfzAfU3tOyB1MrGrvF42ylshDjad98sr0E1joxJJf7F
         gMYNoyfwcQ77h/9yLCtAsDgVo1z2wYkbOoqSUbKV13Tw/d4JfGdZ7yYlbOTiEglE6GQM
         FOyg==
X-Forwarded-Encrypted: i=1; AKwUvBwYRoirTrFiFwIZUI9PpPlOIcmYBHYnBu6fbizEbiMJQu4nHeqwGwO0DEINIdt87KwIB8wA66vRDXF6rQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lF4stQM/jNZZLEYIFgXkkhRkYmOF2wy4h7tLCHOMtoR9Z7/3ne
	85OCNLWjpvNCfxMqlOCelyeu3UhQTBF3P6+clem75KS4939ev3yEVQHA
X-Gm-Gg: AYBFou04Km0luFBGGs1L6qb4Ep/RlfIuZwbIvi1xJDlr9IPUoN0ZsXBQiYIaBiUhfWm
	ls4r7cee0ac7uFJA+9HEqnkMkCr3GXCVKI49W5jmg3uWkzoTj6+GnP48gtv1vd18qDzRYVmvjno
	aDnD9NFMAFZBE3OH4tbiv8dU09V2SQrev3xTss6n63ZgnICYjq1hshvgqPvtRbfaOOeHXwPbJbh
	jWoNdC0g7On7z5T+Ks0i4JQwEVjdccXl8Zb2fY+cWGJJuG26NuGqJ09X/e8ut/4FP5dV9tDkl6i
	L2lXPmPZ63ZQYwSJ9V/RwRMlkjOEDabuam9iXgtZ01MQv7jIDg2QFrG+EWQ+UIjiBibuReDursM
	Re8VrK3taZxYaLpR1C2DM3qkvHuLjqNK/5r+4MozXrR3Ry2w0Ud1JPulwMDyiQCLTBgLgIv/zWH
	PUq03j8Wrm32jatde57IyCwg2TpRnnK1GRiBQHBHuLU4xrFKAcLvkgqijUBV3AnG1uUv27Rr/0F
	HrY7f169Q6QG/O9VEf7oWZ0j4il6FhDZNj9UgmW37W6kNVlA6Se7A==
X-Received: by 2002:a05:600c:1548:b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49fe66f164bmr120031085e9.11.1790365357978;
        Fri, 25 Sep 2026 12:42:37 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de187asm168549765e9.7.2026.09.25.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:42:37 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: bard.liao@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	zlzzm2014@outlook.com
Subject: Test for [PATCH v4] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (Intel)
Date: Fri, 25 Sep 2026 21:42:36 +0200
Message-ID: <20260925194236.9651-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913210849.6446-1-lsa.uz@pm.me>
References: <20260913210849.6446-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Surface Pro 11 with intel lunar lake series suffers form audio problems caused by ghost peripherals, using this patch solves the problem and makes usable not only the speakers, but also the microphone.

The cuality is not the same as in windows, but is good enough for casual use

The Patch seems it has gotten stuck/forgotten, hope this test brings back on track the patch

   Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
