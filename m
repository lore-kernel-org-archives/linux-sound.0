From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Fri, 14 May 1999 10:13:18 +0000
Subject: Re: Bidirectionnal sound card
Message-Id: <marc-linux-sound-92671669928159@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92652008522117@msgid-missing>
In-Reply-To: <marc-linux-sound-92652008522117@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

ljp wrote:
> 
> You will need to buy the OSS sound driver for bi-directional
> sound... The free one does not have support for that. :o(

Wrong. Try looking at the code. The CS423x, es137x, sonicvibes
drivers can do full duplex

Tom
