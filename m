Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420552;
	b=tauBqSCkJI9fzGeXA/MszzQeUmuKpb7bWOBoo4dGWn/d+BHUKzvx4jeCujRW/cfuSoQZ
	 046Cs7Cmk8GFZq+aL+Q4NWiafXQ8XCTJuyPQ9jxEJ8IQT7F57kUGrOSQiHjoUm4zfMtRT
	 RTRXsjuFfyOushIe6MUTDi3aQL5TVWvQ0y4JhYzmg/NCU06Nj12z14evcEr4AbzXhPNxt
	 dBiPkGrVtPC2v9BIosqhSyFyBMAU2L1rFQL/zLF3UmlXSKtEDnnipvKWpBkjoTI3BVwNn
	 hk5DHd9pWLq4dnCBL7BBo1DhEnOraAysMLyjnICWeqMzh3WXOMhk70zR9u7y80xc5hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420552;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zrsxI5xUPLSHfY+SPDkli9CabyKX24nGZ/FGNUexqVo=;
	b=Mj4kS+5jpyNw9v/DXfl1AP3CMByzDUxaIbTaY7iuGHQzEZTFKyYEZccSPCVWJNmVIA8H
	 DScYI9YIoLkz2C2rZzjg2VQvB4r17IhHgODck/qfHa9WEgol7mGg5bWT2R6zfNdYwHoUP
	 DFf3fi9We/t7XTuHrXSrjuG1fkaIb2ZVHMXoD9HH9yZRB6WLgfAWF5Limpc2ZIKFBh9av
	 Q1Y6+I1dxj8kubZcTJ+QI9ZhDtPVkrKDcRLlJmPas7vg0E7XH1Us5eH2AFDUGFFDPwOuU
	 RHsfTNzcVSZPDvJBNWnsU4ZJE3IKOyhJP18Mrg+kCfAPdU+VeOIsT4lV0f5GUTpbs+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEzVMxan;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5D5606A321;
	Mon, 23 Nov 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEzVMxan
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33501F000D4;
	Mon, 23 Nov 2026 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420551;
	bh=zrsxI5xUPLSHfY+SPDkli9CabyKX24nGZ/FGNUexqVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VEzVMxanv7kBe2nMA53YW2EOp0R0dTb4ERRi+VWwoyfqntKqCxwYDdPXK5u8KHohz
	 vYHU8isTDll/++5+NaOL9DoJZ/dSixuzUF9nbtwf2/yxBgjw8kzLf/fJwrW6EsC115
	 Zz/w5A1T22bL0Jr0neHTLW5Msjb1Ij+FptfK7FB7+l2qOqdxTmRcj5yOmhYIFIf4so
	 hSZenJ7UJsb+QkXpIUHDTEB8LWE3J/rdVasJ2fdNpdTzcDTPr0ypaa2FXuVnmWN0GS
	 roN046p91FEFILkyCQSFp146AMBnuL/c3nidsj6FoYL/ijMEuKik+FnDhgZGalrEyh
	 0xyg6mB5DBgJA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v3 03/10] soundwire: stream: Prevent m_rt_count underflow in sdw_stream_remove_master()
Date: Mon, 23 Nov 2026 07:54:24 +0000
Message-ID: <20261123075522.405347-4-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123075522.405347-1-lee@kernel.org>
References: <20261123075522.405347-1-lee@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stream->m_rt_count is incremented in sdw_stream_add_master() after
sdw_master_port_alloc() succeeds.  However, sdw_stream_add_slave() can
allocate a master runtime without allocating master ports, and
sdw_master_port_alloc() can fail after partially populating
m_rt->port_list.  When sdw_stream_remove_master() subsequently tears
down the stream, it unconditionally decrements stream->m_rt_count,
underflowing the counter when master ports were never allocated.

Free any partially allocated master ports on allocation failure in
sdw_master_port_alloc(), and only increment and decrement
stream->m_rt_count when master ports are allocated.

Closes: https://sashiko.dev/#/bug/linux-bce288e6-c97f-46dd-9fc3-023c33d56f36
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: HyeongJun An <sammiee5311@gmail.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---

v2 => v3:
 - Collect Reviewed-by and Tested-by tags (Charles, HyeongJun)

v1 => v2:
 - Drop Fixes and Stable tags

 drivers/soundwire/stream.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 31db368ba24b..573ca35b0e8b 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1113,8 +1113,10 @@ static int sdw_master_port_alloc(struct sdw_master_runtime *m_rt,
 	/* Iterate for number of ports to perform initialization */
 	for (i = 0; i < num_ports; i++) {
 		p_rt = sdw_port_alloc(&m_rt->port_list);
-		if (!p_rt)
+		if (!p_rt) {
+			sdw_master_port_free(m_rt);
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -2063,7 +2065,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		if (ret)
 			goto alloc_error;
 
-		stream->m_rt_count++;
+		if (sdw_master_port_allocated(m_rt))
+			stream->m_rt_count++;
 	}
 
 	ret = sdw_master_rt_config(m_rt, stream_config);
@@ -2110,9 +2113,10 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
 		if (m_rt->bus != bus)
 			continue;
 
+		if (sdw_master_port_allocated(m_rt))
+			stream->m_rt_count--;
 		sdw_master_port_free(m_rt);
 		sdw_master_rt_free(m_rt, stream);
-		stream->m_rt_count--;
 	}
 
 	if (list_empty(&stream->master_list))
-- 
2.56.1.750.gf70dc682cf-goog

