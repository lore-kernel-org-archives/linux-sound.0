Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E9D3FB7E9
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252622; cv=none; b=HHZafS5rAuifNwn+llcnoZNmyrsw1874cOHiIdlIy+sATRHXEUaT+ycintHAL3F2qaYMMyjmP5R1eiUZaIQSgjr4YDfP+UzHGd1LWQNEnl+33DoYx/rUt93DtmZdnqSJAIR7x+Or28+K17B7scCAQHByoqnDwUAWV35lCLiCmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252622; c=relaxed/simple;
	bh=CmXKNxz6FTs7pNnshTPQTPN/nc6ElnxcOs1MLuWqffc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p0EYMd/C9RVOjd8lx0+Xcz0yX9L4h4ywKljYFE2hqy9NOedGUwrsvfodgyRMt/RIVXeGrKDaWEy1gVhbi2tniMJTnBZuHcJIT9xvdcVzX3EQzSwhmEBHCg/zwvAgevNN2nVNHkulHa3HWJTQcldY0YHU/k5W5ayyj8rtBCLueVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YoKHiODu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YoKHiODu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44509921fbcso1152614f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778252620; x=1778857420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb9t9V8pd/4iFj22i4TkGprC/oaCqwOf/T25xMBCN4c=;
        b=YoKHiODufoej/hlF6MX/9xDUc3VuPgZduF/3Kc4uHqUNmb+U6fin9Gh8wynt/PPxAY
         tqDd2i66vtlBYC+poctSxEAXgRwMMQs10bX3qcrOKsyri52EJ96UCaqbITp3lhUHIiyl
         zKDBaWdMjegxcYubNjPP2pnA2tOejp0CELGKLECMtthizV+DYSX+oS1YVTyKA74IqWkC
         AHQgvDS+Mo+BM3T/jX6kK9qC+1S9nQOk9P5JZQWPF11etpJKn/uRXlCJowprpSRzX5EU
         bKVc5VPaI/9IhiZck2zKLZ77C4P7UcFMQPBixQYO5cuS5cAYPCH7LOWXH9v49lr9MdMm
         lCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252620; x=1778857420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pb9t9V8pd/4iFj22i4TkGprC/oaCqwOf/T25xMBCN4c=;
        b=RQIsV7rziq5Jva/XLh3PBwseRIMfT07GjbSjnfIf2ecRKozlFeGcCAHQxcdZJCo89g
         uRw7ejqCg1uIvrU93RWxhRrNP7O35/YNm1lK8sJhkASaEYUKgynKdnAjUjcDYAZSV5qk
         xeYAcjqrPIz+PoxkGCWzhI1YCa4NvrsAoVldKNme6+odwI0PwczlKza+TbfvE3JSvmoD
         W+Omb1siBdV0pFRTYF1aETVJQ/H4sIRJDsx1GHGqhn9cttYsvp2lummMSKlMpoCVH8Ec
         yR0LahgbLVreom923ZmjYOA3n0vMt8gj6AGUZ6dtXsG5ReSvJy6/I5Xe3diT1Ng5X2ha
         Ts5w==
X-Forwarded-Encrypted: i=1; AFNElJ/xxUnLmA62l2DDcm66KnIZbin4cwIeLt2ew7vUs3vnHmgfaaUS0wc/pV1I4ORG7ZtYUrsiYWbML+othA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlvSy1sNMi4zz+pxfvv+NDfuc1L1XW0v0M1LXkBdo8o34s4oCV
	x8mNZDmgbHJxVhlYKtZ0R49nAOQIYP2NSXt7UDBApSP5EIrgNn5xPOUeBgCrQAHwbkg=
X-Gm-Gg: Acq92OHH1emAr6yU21YCmk0bvwJlJ4QDZFJjEQ798DHHTovEMBOwJVQzvZMBIOnJo7G
	98tRc22n5oIRCkjYNeMIuG5mQwicg4L93FQmW414jEsUkZEbdq8834CWFNcc0lw+blqAszQMQEI
	WSNUTOCVBWDEbORGARxguTq/2gojlbh0THRFeCEGqcX2ZBihsa363u5rcnBXmxrHkBAehhQVDHj
	DGbNy9sthp+lg+3U18eaFaRxKKayRVTSjB9bpJ/C+OpkQaNOzkLaP6wVYSZmWN04alNl4IgIfV/
	isPQvkM3r9r0R4UFwMB+6YfhOX3jMcQ4uKznPjJ2r6MUQ7m0QxlBBBeUSsrX3TQNJwfj8itXFGo
	E8aH9+ZBy//edIHkQlverUSvQfAKIMRU8UVi/WqZZZptdYGcos0ySd+OA8qi0ucjVdBjZ7JzcMe
	fXPbc07gH+AstnFA3DZwhw/ki4WL6XIK6SRZ1RMvuUS7GlnOc=
X-Received: by 2002:a05:6000:2910:b0:43d:c95c:4259 with SMTP id ffacd0b85a97d-4515d3dc52fmr20283278f8f.30.1778252619480;
        Fri, 08 May 2026 08:03:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm5262918f8f.30.2026.05.08.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:03:38 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	patches@opensource.cirrus.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [RFC PATCH 0/2] ASoC: Move system_long_wq to system_dfl_long_wq
Date: Fri,  8 May 2026 17:03:17 +0200
Message-ID: <20260508150327.351779-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Currently the code uses the per-cpu workqueue system_long_wq to schedule
long running works.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Another good reason to have this unbound,
is the "queue_delayed_work()" function, used to enqueue the work item.
More details on this will follow in the next section.

Recently, a new unbound workqueue specific for long running work has been
added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

~~~ Details about queue_delayed_work ~~~

system_long_wq is a per-cpu workqueue and it is used as a parameter of
queue_delayed_work(). This function schedule an item that it will later
be enqueued (once the timer will fire). __queue_delayed_work() does the job
receiving as "cpu" WORK_CPU_UNBOUND:

    if (housekeeping_enabled(HK_TYPE_TIMER)) {
    //      [....]
    } else {
            if (likely(cpu == WORK_CPU_UNBOUND))
                    add_timer_global(timer);
            else
                    add_timer_on(timer, cpu);
    }

The timer is global, so can fire everywhere, and the work item will be
enqueued where the timer fired.

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change the
workqueue with the new system_dfl_long_wq, so that the used workqueue is
now unbound and can benefit from scheduler task placement.

Thanks!

Marco Crivellari (2):
  ASoC: cs42l43: Move long delayed work on system_dfl_long_wq
  ASoC: codecs: rt5640: Move long delayed work on system_dfl_long_wq

 sound/soc/codecs/cs42l43-jack.c |  5 +++--
 sound/soc/codecs/rt5640.c       | 13 +++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.53.0

